SELECT 
  @year:=`year`,
  @month:=`month`,
  @customer:=`customer`,
  IFNULL(sum(`value_rashod`),0) as rashod,
  IFNULL(sum(`value_prihod`),0) as prihod,
  ( SELECT IFNULL(sum(`value`),0) as prihod FROM `income` where `customer` = @customer and (YEAR(`date`)<@year or (YEAR(`date`)=@year and MONTH(`date`)<=@month)) ) 
   -
  ( SELECT IFNULL(sum(`value`),0) as rashod FROM `invoice` where `customer` = @customer and (YEAR(`date`)<@year or (YEAR(`date`)=@year and MONTH(`date`)<=@month)) ) 
  as ost

FROM

  (
    SELECT YEAR(`date`) as year, MONTH(`date`) as month, `customer`, `value` as value_rashod, 0 as value_prihod FROM `invoice` 
    UNION 
    SELECT YEAR(`date`) as year, MONTH(`date`) as month, `customer`, 0 as value_rashod, `value` as value_prihod FROM `income` 
  ) as t
 group by `year`, `month`, `customer` 


 order by `year`, `month`, `customer`   