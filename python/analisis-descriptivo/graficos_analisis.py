# -*- coding: utf-8 -*-
import pandas as pd, numpy as np, matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
OUT = r"C:\Users\Jhonniel\AppData\Local\Temp\claude\C--Users-Jhonniel-Documents-Biblioteca-Jhonniel-Unicaribe-2026-Agosto-Ciencia-de-datos-Introduccion-a-la-ciencia-de-Datos-Recursos\57db1601-854c-4fee-af5f-5b796c0efbc2\scratchpad\u5a1"
df = pd.read_csv(r"C:\Users\Jhonniel\Downloads\banco_comercial_solicitudes.csv")
df['Fecha_Solicitud']=pd.to_datetime(df.Fecha_Solicitud); df['Fecha_Decision']=pd.to_datetime(df.Fecha_Decision)
df['Dias']=(df.Fecha_Decision-df.Fecha_Solicitud).dt.days
df['Aprobada']=df.Resultado_Decision!='Rechazado'
NAVY="#1B3A6B"
plt.rcParams.update({"font.family":"DejaVu Sans","font.size":11,"axes.titlesize":13,
                     "axes.titleweight":"bold","figure.dpi":140})

# --- 1. CURVA DE LORENZ ---
x=np.sort(df.Monto_Solicitado.values); n=len(x)
cum=np.concatenate([[0],np.cumsum(x)/x.sum()]); pp=np.linspace(0,1,n+1)
gini=(2*np.sum(np.arange(1,n+1)*x)/(n*x.sum()))-(n+1)/n
fig,ax=plt.subplots(figsize=(7,6))
ax.plot([0,1],[0,1],'--',color='#888',lw=1.5,label='Equidad perfecta')
ax.plot(pp,cum,color=NAVY,lw=2.5,label='Distribución real')
ax.fill_between(pp,cum,pp,color=NAVY,alpha=0.15)
ax.set_title('Curva de Lorenz — concentración del monto solicitado')
ax.set_xlabel('Proporción acumulada de solicitudes')
ax.set_ylabel('Proporción acumulada del monto')
ax.text(0.55,0.22,'Índice de Gini = %.4f'%gini,fontsize=13,fontweight='bold',color=NAVY,
        bbox=dict(boxstyle='round,pad=0.5',fc='white',ec=NAVY))
ax.legend(loc='upper left'); ax.grid(ls=':',alpha=.4)
ax.spines[['top','right']].set_visible(False)
plt.tight_layout(); plt.savefig(OUT+r"\01-lorenz.png"); plt.close()

# --- 2. RIESGO x DECISION (barras apiladas 100%) ---
orden=['Riesgo bajo','Riesgo medio','Riesgo alto','Riesgo muy alto']
ct=pd.crosstab(df.Categoria_Riesgo,df.Resultado_Decision,normalize='index').reindex(orden)*100
cols={'Aprobado':NAVY,'Aprobado parcial':'#4E7FBF','Rechazado':'#C0392B'}
fig,ax=plt.subplots(figsize=(8.5,5))
left=np.zeros(len(ct))
for c in ['Aprobado','Aprobado parcial','Rechazado']:
    v=ct[c].values if c in ct else np.zeros(len(ct))
    ax.barh(ct.index,v,left=left,color=cols[c],label=c)
    for i,(val,l) in enumerate(zip(v,left)):
        if val>4: ax.text(l+val/2,i,'%.0f%%'%val,ha='center',va='center',color='white',fontweight='bold',fontsize=10)
    left+=v
ax.set_title('Resultado de la decisión según categoría de riesgo')
ax.set_xlabel('Porcentaje de solicitudes'); ax.set_xlim(0,100)
ax.legend(loc='lower center',bbox_to_anchor=(.5,-.28),ncol=3,frameon=False)
ax.spines[['top','right']].set_visible(False)
plt.tight_layout(); plt.savefig(OUT+r"\02-riesgo-decision.png"); plt.close()

# --- 3. ANALISTAS: riesgo vs tasa aprobacion ---
a=df.dropna(subset=['Analista_Responsable']).groupby('Analista_Responsable').agg(
    Casos=('ID_Solicitud','count'),Tasa=('Aprobada','mean'),Riesgo=('Score_Interno','mean'))
a['Tasa']*=100
fig,ax=plt.subplots(figsize=(8.5,5.5))
ax.scatter(a.Riesgo,a.Tasa,s=a.Casos*28,color=NAVY,alpha=.75,edgecolors='white',zorder=3)
for nm,r in a.iterrows():
    ax.annotate(nm,(r.Riesgo,r.Tasa),textcoords='offset points',xytext=(0,14),
                ha='center',fontsize=10,fontweight='bold')
ax.axhline(df.Aprobada.mean()*100,color='#C0392B',ls='--',lw=1.5,
           label='Tasa global 65.00%')
ax.set_title('Tasa de aprobación vs riesgo promedio atendido, por analista')
ax.set_xlabel('Score de riesgo interno promedio de su cartera')
ax.set_ylabel('Tasa de aprobación (%)')
ax.legend(); ax.grid(ls=':',alpha=.4)
ax.spines[['top','right']].set_visible(False)
plt.tight_layout(); plt.savefig(OUT+r"\03-analistas.png"); plt.close()

# --- 4. CONCENTRACION POR PRODUCTO: solicitudes vs monto ---
t=df.groupby('Tipo_Producto').agg(S=('ID_Solicitud','count'),M=('Monto_Solicitado','sum'))
t['pS']=t.S/t.S.sum()*100; t['pM']=t.M/t.M.sum()*100
t=t.sort_values('pM',ascending=True)
y=np.arange(len(t)); h=0.38
fig,ax=plt.subplots(figsize=(9,5))
b1=ax.barh(y-h/2,t.pS,h,color='#7FA8D9',label='% de solicitudes')
b2=ax.barh(y+h/2,t.pM,h,color=NAVY,label='% del monto')
ax.bar_label(b1,fmt='%.1f%%',padding=3,fontsize=9)
ax.bar_label(b2,fmt='%.1f%%',padding=3,fontsize=9)
ax.set_yticks(y); ax.set_yticklabels(t.index)
ax.set_title('Volumen de solicitudes frente a exposición económica')
ax.set_xlabel('Porcentaje'); ax.set_xlim(0,90)
ax.legend(); ax.spines[['top','right']].set_visible(False)
plt.tight_layout(); plt.savefig(OUT+r"\04-producto-concentracion.png"); plt.close()
print("graficos U5 listos")
import os
for f in sorted(os.listdir(OUT)): print("  ",f)
