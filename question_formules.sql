
-- 1. Vérification du coût moyen des sinistres par formule.

SELECT
    c.formule,
    COUNT(*) AS nb_sinistres,
    ROUND(SUM(s.montant_estime), 2) AS montant_total_estime,
    ROUND(AVG(s.montant_estime), 2) AS cout_moyen_par_sinistre
FROM clean_fact_sinistre s
JOIN clean_dim_contrat c
    ON s.contrat_id = c.contrat_id
WHERE c.formule IN ('Premium', 'Essentielle')
GROUP BY c.formule
ORDER BY c.formule;

-- Comparaison des primes théoriques et indemnisations payées en 2024.

WITH primes AS (
    SELECT
        formule,
        COUNT(*) AS nb_contrats,
        SUM(prime_annuelle) AS primes_theoriques
    FROM clean_dim_contrat
    WHERE formule IN ('Premium', 'Essentielle')
      AND date_debut <= '2024-01-01'
      AND (date_fin IS NULL OR date_fin >= '2024-12-31')
    GROUP BY formule
),

-- Conservation des indemnisations marquées « payé » en 2024.
indemnisations
 AS (
    SELECT
        c.formule,
        SUM(i.montant_indemnise) AS montant_paye
    FROM clean_fact_indemnisation i
    JOIN clean_fact_sinistre s
        ON i.sinistre_id = s.sinistre_id
    JOIN clean_dim_contrat c
        ON s.contrat_id = c.contrat_id
    WHERE i.statut_paiement = 'payé'
      AND i.date_paiement >= '2024-01-01'
      AND i.date_paiement < '2025-01-01'
      AND c.formule IN ('Premium', 'Essentielle')
    GROUP BY c.formule
)
SELECT
    p.formule,
    p.nb_contrats,
    ROUND(p.primes_theoriques, 2) AS primes_theoriques_2024,
    ROUND(COALESCE(i.montant_paye, 0), 2) AS indemnisations_payees_2024,
    ROUND(100 * COALESCE(i.montant_paye, 0) / p.primes_theoriques, 2)
        AS indemnisations_pour_100_euros_de_primes
FROM primes p
LEFT JOIN indemnisations i
    ON p.formule = i.formule
ORDER BY p.formule;
