-- Ejercicio 1

-- https://livesql.oracle.com/apex/livesql/file/content_FXEX3BA5QNS8NXUDZ8T84MBLK.html
-- Tabla de verdad:
-- https://docs.oracle.com/en/database/oracle/oracle-database/12.2/lnpls/plsql-language-fundamentals.html#GUID-9D19FEBB-A397-47F5-A4EC-D71B0DE91738

-- c := a AND b
-- TRUE AND TRUE -> TRUE
-- TRUE AND FALSE -> FALSE
-- NULL AND TRUE -> NULL
-- NULL AND FALSE -> FALSE

--------------------------------------------------
-- c := a OR b
-- TRUE OR TRUE -> TRUE
-- TRUE OR FALSE -> TRUE
-- NULL OR TRUE -> NULL
-- NULL OR FALSE -> NULL