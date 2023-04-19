slect dh.PF_CODE as CODE, dh.PF_NAME as NAME, ROUND(100.0 * SUM(CASE dh.CATEGORY_CODE WHEN '120' THEN dh.AMT_CODE ELSE 0 END) / SUM(CASE dh.CATEGORY_CODE WHEN '110' THEN dh.AMT ELSE 0 END) , 1) as PERCENTAGE
from DRINK_HABITS as dh
inner join PREFECTURE as pf
  on pf.PF_CODE = dh.PF_CODE
where dh.GENDER_CODE IN('2', '3')
group by dh.PF_CODE
order by  PERCENTAGE DESC, p.PF_CODE DESC;
