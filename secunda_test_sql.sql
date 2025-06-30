-- 4. Написать SQL запрос по отчету 2, который выведет клиентов
-- с регионом выдачи онлайн и выданные в 2024 году
SELECT
  "ContractID" AS номер_контракта,
  "ClientID" AS id_клиента,
  "SubdivisionName" AS регион_выдачи,
  "LoanAmount" AS сумма_выдачи,
  "DateStatus" AS дата_выдачи
FROM "отчет 2"
WHERE "SubdivisionName" = 'онлайн'
  AND EXTRACT(YEAR FROM "DateStatus") = 2024;

-- 5. Написать SQL запрос по отчету 2, который выведет три поля: статус,
-- количество клиентов в статусе, сумму выданных займов в статусе
SELECT
  "Status" AS статус,
  COUNT("ContractID") AS количество_клиентов,
  SUM("LoanAmount") AS сумма_выданных_займов
FROM "отчет 2"
GROUP BY "Status"
ORDER BY количество_клиентов DESC;

-- 6. Написать SQL запрос, который выведет все поля отчета 1 и отчета 2
-- сделала через два варианта joinов, потому что в задании не сказано,
-- какое именно объединение требуется
SELECT
  o1.*,
  o2.*
FROM "отчет 1" o1
JOIN "отчет 2" o2
  ON o1."Номер контракта" = o2."ContractID";

SELECT
  o1.*,
  o2.*
FROM "отчет 1" o1
FULL OUTER JOIN "отчет 2" o2
  ON o1."Номер контракта" = o2."ContractID";