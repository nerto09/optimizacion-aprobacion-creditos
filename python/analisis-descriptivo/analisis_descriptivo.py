# -*- coding: utf-8 -*-
"""Unidad 5 Actividad 1 - Analisis descriptivo completo"""
import pandas as pd, numpy as np
CSV = r"C:\Users\Jhonniel\Downloads\banco_comercial_solicitudes.csv"
df = pd.read_csv(CSV)
df['Fecha_Solicitud'] = pd.to_datetime(df['Fecha_Solicitud'])
df['Fecha_Decision']  = pd.to_datetime(df['Fecha_Decision'])
df['Dias_Decision'] = (df['Fecha_Decision'] - df['Fecha_Solicitud']).dt.days
df['Aprobada'] = df['Resultado_Decision'] != 'Rechazado'

def sec(t): print("\n" + "="*70 + "\n" + t + "\n" + "="*70)

sec("1. DIMENSIONES Y CALIDAD")
print("Registros:", len(df), "| Variables:", df.shape[1])
print("Duplicados:", df.duplicated().sum())
print("Nulos totales:", int(df.isnull().sum().sum()))
print("\nNulos por columna (solo >0):")
n = df.isnull().sum(); print(n[n>0].to_string())
print("\nRango de fechas:", df.Fecha_Solicitud.min().date(), "a", df.Fecha_Solicitud.max().date())

sec("2. MONTO SOLICITADO - MEDIDAS")
m = df.Monto_Solicitado
print("Suma      : {:,.2f}".format(m.sum()))
print("Media     : {:,.2f}".format(m.mean()))
print("Mediana   : {:,.2f}".format(m.median()))
print("Ratio media/mediana: {:.2f}".format(m.mean()/m.median()))
print("Desv.tipica: {:,.2f}".format(m.std()))
print("CV        : {:.1f} %".format(m.std()/m.mean()*100))
print("Asimetria : {:.3f}".format(m.skew()))
print("Curtosis  : {:.3f}".format(m.kurtosis()))
print("Min / Max : {:,.2f} / {:,.2f}".format(m.min(), m.max()))

sec("3. CONCENTRACION - GINI Y LORENZ")
def gini(x):
    x = np.sort(np.asarray(x, dtype=float)); n = len(x)
    return (2*np.sum((np.arange(1,n+1))*x)/(n*np.sum(x))) - (n+1)/n
g = gini(m.values)
print("Indice de Gini del Monto_Solicitado: {:.4f}".format(g))
s = np.sort(m.values)[::-1]; tot = s.sum()
for pct in [10,20,25,30,50]:
    k = max(1,int(round(len(s)*pct/100)))
    print("  Top {:>2}% de solicitudes ({:>2}) concentra {:>5.1f}% del monto".format(pct,k,s[:k].sum()/tot*100))

sec("4. POR TIPO DE PRODUCTO")
t = df.groupby('Tipo_Producto').agg(
    Solicitudes=('ID_Solicitud','count'),
    Monto_Total=('Monto_Solicitado','sum'),
    Monto_Promedio=('Monto_Solicitado','mean'),
    Tasa_Aprob=('Aprobada','mean'),
    Riesgo=('Score_Interno','mean'),
    Dias=('Dias_Decision','mean')).sort_values('Monto_Total', ascending=False)
t['%_Solic'] = t.Solicitudes/len(df)*100
t['%_Monto'] = t.Monto_Total/df.Monto_Solicitado.sum()*100
t['Tasa_Aprob'] *= 100
print(t.round(2).to_string())

sec("5. POR ANALISTA")
a = df.dropna(subset=['Analista_Responsable']).groupby('Analista_Responsable').agg(
    Casos=('ID_Solicitud','count'),
    Tasa_Aprob=('Aprobada','mean'),
    Riesgo=('Score_Interno','mean'),
    Dias=('Dias_Decision','mean')).sort_values('Tasa_Aprob', ascending=False)
a['Tasa_Aprob'] *= 100
print(a.round(2).to_string())
print("\nDispersion (max-min) tasa aprobacion: {:.2f} puntos".format(a.Tasa_Aprob.max()-a.Tasa_Aprob.min()))
print("Automatica (sin analista):", df.Analista_Responsable.isna().sum(), "casos")
auto = df[df.Analista_Responsable.isna()]
print("  tasa aprob: {:.2f}% | riesgo prom: {:.3f}".format(auto.Aprobada.mean()*100, auto.Score_Interno.mean()))

sec("6. POR CANAL")
c = df.groupby('Canal_Solicitud').agg(
    Solicitudes=('ID_Solicitud','count'),
    Dias=('Dias_Decision','mean'),
    Tasa_Aprob=('Aprobada','mean'),
    Monto_Prom=('Monto_Solicitado','mean')).sort_values('Dias', ascending=False)
c['Tasa_Aprob'] *= 100
print(c.round(2).to_string())
print("\nBrecha canal mas lento vs mas rapido: {:.2f} dias".format(c.Dias.max()-c.Dias.min()))

sec("7. TABLA DE CONTINGENCIA: RIESGO x DECISION")
ct = pd.crosstab(df.Categoria_Riesgo, df.Resultado_Decision, margins=True)
print(ct.to_string())
print("\n% por fila:")
print((pd.crosstab(df.Categoria_Riesgo, df.Resultado_Decision, normalize='index')*100).round(1).to_string())

sec("8. TENDENCIA MENSUAL")
serie = df.set_index('Fecha_Solicitud').resample('MS').agg(
    Solicitudes=('ID_Solicitud','count'), Monto=('Monto_Solicitado','sum'), Aprob=('Aprobada','mean'))
serie['Aprob'] *= 100
serie.index = serie.index.strftime('%b')
print(serie.round(2).to_string())
prim, ult = serie.Solicitudes.iloc[:4].sum(), serie.Solicitudes.iloc[4:].sum()
print("\nEne-Abr: {} | May-Ago: {} | variacion: {:+.1f}%".format(prim, ult, (ult-prim)/prim*100))

sec("9. TIEMPO DE DECISION")
d = df.Dias_Decision
print("Media: {:.2f} | Mediana: {:.1f} | Min: {} | Max: {}".format(d.mean(), d.median(), d.min(), d.max()))
print("Aprobadas: {:.2f} dias | Rechazadas: {:.2f} dias".format(
    df[df.Aprobada].Dias_Decision.mean(), df[~df.Aprobada].Dias_Decision.mean()))

sec("10. CORRELACIONES")
cols = ['Monto_Solicitado','Ingreso_Mensual','Score_Buro','Score_Interno','Dias_Decision','Deuda_Total_Actual']
print(df[cols].corr().round(3).to_string())

sec("11. VALORES ATIPICOS (metodo IQR)")
q1,q3 = m.quantile(.25), m.quantile(.75); iqr = q3-q1; lim = q3+1.5*iqr
out = df[m>lim]
print("Limite superior: {:,.2f}".format(lim))
print("Atipicos: {} solicitudes ({:.1f}%) que concentran {:.1f}% del monto".format(
    len(out), len(out)/len(df)*100, out.Monto_Solicitado.sum()/m.sum()*100))
if len(out):
    print(out[['ID_Solicitud','Tipo_Producto','Monto_Solicitado','Score_Interno','Resultado_Decision']].to_string(index=False))

sec("12. MOTIVOS DE RECHAZO")
print(df.Motivo_Rechazo.value_counts().to_string())
