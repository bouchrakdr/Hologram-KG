
-- TPC-H Q1 (simplified)
SELECT
    l_returnflag,
    l_linestatus
FROM
    lineitem;


-- TPC-H Q3 (simplified)
SELECT
    l_orderkey,
    o_orderdate,
    o_shippriority
FROM
    customer AS c,
    orders   AS o,
    lineitem AS l
WHERE
    c.c_custkey = o.o_custkey
    AND l.l_orderkey = o.o_orderkey;


-- TPC-H Q9 (simplified)
SELECT
    s.s_name,
    n.n_name,
    p.p_mfgr,
    s.s_address,
    ps.ps_comment
FROM
    part     AS p,
    supplier AS s,
    partsupp AS ps,
    nation   AS n,
    region   AS r
WHERE
    p.p_partkey   = ps.ps_partkey
    AND s.s_suppkey   = ps.ps_suppkey
    AND s.s_nationkey = n.n_nationkey
    AND n.n_regionkey = r.r_regionkey;
