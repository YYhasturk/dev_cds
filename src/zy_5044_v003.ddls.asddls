@AbapCatalog.sqlViewName: 'ZY_5044_CDS_V003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds3'
define view ZY_5044_V003 as select from Zy_5044_cds_v002  
{
    vbeln,
    sum(conversion_netwr) as Toplam_Net_Deger,
    kunnrAd,
    count(*)  as Toplam_Fatura_Adedi,
    division(cast( sum(conversion_netwr) as abap.curr( 10,3 ) ), cast( count(*) as abap.int1 ), 3) as Ortalama_Miktar,
    left(fkdat,4)  as Faturalama_Yili,
    substring(fkdat,5,2)   as Faturalama_Ayi,
    substring(fkdat,7,2)   as Faturalama_Gunu,
    substring(inco2_l,1,3) as Incoterm_Yeri

}
    group by
    vbeln,
    kunnrAd,
    fkdat,
    inco2_l
