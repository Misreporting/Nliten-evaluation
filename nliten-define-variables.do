set maxvar 32000
*use "/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181019.dta"
*use "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/nliten20191226.dta"
use "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/nliten20181019.dta"

gen age0=a1_a
gen somecollege0=a2_a==4 | a2_a==5
gen ba0= a2_a==5
gen live_with_parents=a3_a==4
 




*** Public assistance
* 83% gets SNAP.
tab1 a4_a*
gen snap0=a4_a_02==2


gen anytreat=treat==2 | treat==3
gen extratreat=treat==3

* AUDIT 3 items 

** Audit not past year:  alpha=0.76
factor b1_a b2_a b3_a b4_a b5_a b6_a b7_a b8_a b9_a b10_a, factors(2)
rotate
alpha b1_a b2_a b3_a
gen alcoholfreq0=b1_a + b2_a + b3_a -3 
gen alcoholfreq3=b1_c + b2_c + b3_c -3 
gen alcoholfreq6=b1_d + b2_d + b3_d -3 
gen alcoholfreq9=b1_e + b2_e + b3_e -3 
gen alcoholfreq12=b1_f + b2_f + b3_f -3 
replace alcoholfreq3=. if alcoholfreq3==15
replace alcoholfreq6=. if alcoholfreq6==15
replace alcoholfreq9=. if alcoholfreq9==15
replace alcoholfreq12=. if alcoholfreq12==15


* Drinking frequency
gen drink_freq0=b1_a-1
gen drink_freq3=b1_c-1
gen drink_freq6=b1_d-1
gen drink_freq9=b1_e-1
gen drink_freq12=b1_f-1
replace drink_freq3=. if b1_c==6
replace drink_freq6=. if b1_d==6
replace drink_freq9=. if b1_e==6
replace drink_freq12=. if b1_f==6

* Marijuana daily
gen marijuana_daily0=b43_a==30 | b43_a==31
gen marijuana_daily3=b43_c==30 | b43_c==31
gen marijuana_daily6=b43_d==30 | b43_d==31
gen marijuana_daily9=b43_e==30 | b43_e==31
gen marijuana_daily12=b43_f==30 | b43_f==31
replace marijuana_daily3=. if b42_c==3
replace marijuana_daily6=. if b42_d==3
replace marijuana_daily9=. if b42_e==3
replace marijuana_daily12=. if b42_f==3

gen marijuana_daily_any=marijuana_daily3==1 | marijuana_daily6==1 | marijuana_daily9==1 | marijuana_daily12==1
gen marijuana_daily_all=marijuana_daily3==1 & marijuana_daily6==1 & marijuana_daily9==1 & marijuana_daily12==1

* Marijuana in past month
gen marijuana_month0=b43_a>0 & b43_a<99
gen marijuana_month3=b43_c>0 & b43_c<99
gen marijuana_month6=b43_d>0 & b43_d<99
gen marijuana_month9=b43_e>0 & b43_e<99
gen marijuana_month12=b43_f>0 & b43_f<99
replace marijuana_month3=. if b42_c==3
replace marijuana_month6=. if b42_d==3
replace marijuana_month9=. if b42_e==3
replace marijuana_month12=. if b42_f==3

gen marijuana_freq0=b43_a
replace marijuana_freq0=0 if b42_a==1
gen marijuana_freq3=b43_c
replace marijuana_freq3=0 if b42_c==1
replace marijuana_freq3=. if missing3==1
gen marijuana_freq6=b43_d
replace marijuana_freq6=0 if b42_d==1
replace marijuana_freq6=. if missing6==1
gen marijuana_freq9=b43_e
replace marijuana_freq9=0 if b42_e==1
replace marijuana_freq9=. if missing9==1
gen marijuana_freq12=b43_f
replace marijuana_freq12=0 if b42_f==1
replace marijuana_freq12=. if missing12==1

* drink more than weekly
gen drink_weekly0=drink_freq0==3 | drink_freq0==4
gen drink_weekly3=drink_freq3==3 | drink_freq3==4
gen drink_weekly6=drink_freq6==3 | drink_freq6==4
gen drink_weekly9=drink_freq9==3 | drink_freq9==4
gen drink_weekly12=drink_freq12==3 | drink_freq12==4
replace drink_weekly3=. if drink_freq3==.
replace drink_weekly6=. if drink_freq6==.
replace drink_weekly9=. if drink_freq9==.
replace drink_weekly12=. if drink_freq12==.

* Typical drinks on drinking day
gen drink_num0=b2_a-1
gen drink_num3=b2_c-1
gen drink_num6=b2_d-1
gen drink_num9=b2_e-1
gen drink_num12=b2_f-1
replace drink_num3=. if b2_c==6
replace drink_num6=. if b2_d==6
replace drink_num9=. if b2_e==6
replace drink_num12=. if b2_f==6

* Usually drink 1-2 drinks on a day when drinking
gen drink_moderate0=drink_num0==0
gen drink_moderate3=drink_num3==0
gen drink_moderate6=drink_num6==0
gen drink_moderate9=drink_num9==0
gen drink_moderate12=drink_num12==0
replace drink_moderate3=. if drink_num3==.
replace drink_moderate6=. if drink_num6==.
replace drink_moderate9=. if drink_num9==.
replace drink_moderate12=. if drink_num12==.

gen drink_excess0=1-drink_moderate0
gen drink_excess3=1-drink_moderate3
gen drink_excess6=1-drink_moderate6
gen drink_excess9=1-drink_moderate9
gen drink_excess12=1-drink_moderate12


* Binge drinking
gen binge_freq0=b3_a-1
gen binge_freq3=b3_c-1
gen binge_freq6=b3_d-1
gen binge_freq9=b3_e-1
gen binge_freq12=b3_f-1
replace binge_freq3=. if b3_c==6 
replace binge_freq6=. if b3_d==6 
replace binge_freq9=. if b3_e==6 
replace binge_freq12=. if b3_f==6 

gen binge_weekly0=binge_freq0==3 | binge_freq0==4
gen binge_weekly3=binge_freq3==3 | binge_freq3==4
gen binge_weekly6=binge_freq6==3 | binge_freq6==4
gen binge_weekly9=binge_freq9==3 | binge_freq9==4
gen binge_weekly12=binge_freq12==3 | binge_freq12==4
replace binge_weekly3=. if binge_freq3==.
replace binge_weekly6=. if binge_freq6==.
replace binge_weekly9=. if binge_freq9==.
replace binge_weekly12=. if binge_freq12==.


* Exchange sex
gen exchangesex0=h3_a==2
gen exchangesex3=h3_c==2
gen exchangesex6=h3_d==2
gen exchangesex9=h3_e==2
gen exchangesex12=h3_f==2
replace exchangesex3=. if h3_c==3
replace exchangesex6=. if h3_d==3
replace exchangesex9=. if h3_e==3
replace exchangesex12=. if h3_f==3
gen any_exchange_sex=exchangesex3==1 | exchangesex6==1 | exchangesex9==1 | exchangesex12==1


* Composite measure of drinking, drinking to excess, weekly binging.
* 12.5% binge weekly at least once, 2 people binge weekly all waves
gen binge_weekly_any=binge_weekly3==1 | binge_weekly6==1 | binge_weekly9==1 | binge_weekly12==1
gen binge_weekly_all=binge_weekly3==1 & binge_weekly6==1 & binge_weekly9==1 & binge_weekly12==1

* 50% drink to excess at least once.  4% drink to excess all,
gen drink_excess_any = drink_excess3==1 | drink_excess6==1 | drink_excess9==1 | drink_excess12==1
gen drink_excess_all = drink_excess3==1 & drink_excess6==1 & drink_excess9==1 & drink_excess12==1

* 28% drink weekly
gen drink_weekly_any = drink_weekly3==1 | drink_weekly6==1 | drink_weekly9==1 | drink_weekly12==1


* a = 0 m, there's no b, c = 3 m , d = 6 m , e = 9 m, f = 12 m
* Baseline and 12 months AUDIT
tab AUDIT_a
tab AUDIT_f
gen audit0=AUDIT_a
gen audit3m=AUDIT_c
gen audit6m=AUDIT_d
gen audit9m=AUDIT_e
gen audit12m= AUDIT_f
replace audit3m=. if AUDIT_c==999
replace audit6m=. if AUDIT_d==999
replace audit9m=. if AUDIT_e==999
replace audit12m=. if AUDIT_f==999

gen alcoholproblem0=AUDIT_a>=8
gen alcoholproblem12m=audit12m>=8
replace alcoholproblem12m=. if AUDIT_f==999

tab AUDIT_a alcoholproblem0, missing
tab AUDIT_f alcoholproblem12m, missing

gen auditzone0=.
replace auditzone0=1 if audit0<8
replace auditzone0=2 if audit0>=8 & audit0<=15
replace auditzone0=3 if audit0>=16 & audit0<=19
replace auditzone0=4 if audit0>=20

gen auditzone3m=.
replace auditzone3m=1 if audit3m<8
replace auditzone3m=2 if audit3m>=8 & audit3m<=15
replace auditzone3m=3 if audit3m>=16 & audit3m<=19
replace auditzone3m=4 if audit3m>=20
replace auditzone3m=. if audit3m==.

gen auditzone6m=.
replace auditzone6m=1 if audit6m<8
replace auditzone6m=2 if audit6m>=8 & audit6m<=15
replace auditzone6m=3 if audit6m>=16 & audit6m<=19
replace auditzone6m=4 if audit6m>=20
replace auditzone6m=. if audit6m==.

gen auditzone9m=.
replace auditzone9m=1 if audit9m<8
replace auditzone9m=2 if audit9m>=8 & audit9m<=15
replace auditzone9m=3 if audit9m>=16 & audit9m<=19
replace auditzone9m=4 if audit9m>=20
replace auditzone9m=. if audit9m==.

gen auditzone12m=.
replace auditzone12m=1 if audit12m<8
replace auditzone12m=2 if audit12m>=8 & audit12m<=15
replace auditzone12m=3 if audit12m>=16 & audit12m<=19
replace auditzone12m=4 if audit12m>=20
replace auditzone12m=. if audit12m==.
tab auditzone12m

gen auditzone3=auditzone3m
gen auditzone6=auditzone6m
gen auditzone9=auditzone9m
gen auditzone12=auditzone12m

gen alcoholrisk0=auditzone0==2 | auditzone0==3 | auditzone0==4
gen alcoholrisk3=auditzone3==2 | auditzone3==3 | auditzone3==4
replace alcoholrisk3=. if audit3m==.
gen alcoholrisk6=auditzone6==2 | auditzone6==3 | auditzone6==4
replace alcoholrisk6=. if audit6m==.
gen alcoholrisk9=auditzone9==2 | auditzone9==3 | auditzone9==4
replace alcoholrisk9=. if audit9m==.
gen alcoholrisk12=auditzone12==2 | auditzone12==3 | auditzone12==4
replace alcoholrisk12=. if audit12m==.

gen treat=Cond_a
label define treatment 1 "Control" 2 "Horizons" 3 "Horizons + GMET"
label values treat treatment


*********
* check:  Alc_Context and subscales
* Alc_Expect,   Alc_Control, MJ_Control, Alc_Intent, Alc_RefSE, PNorm_Sub Use, 
*PNorm_Sex STDKnow Sex_RefSE
* Power 

* Alc Context
tab1 o1_a o2_a o3_a o4_a o5_a o6_a o7_a o8_a o9_a
factor o1_a o2_a o3_a o4_a o5_a o6_a o7_a o8_a o9_a, factors(1)
*Scale reliability coefficient:      0.9063
alpha o1_a o2_a o3_a o4_a o5_a o6_a o7_a o8_a o9_a
codebook o1_a o2_a o3_a o4_a o5_a o6_a o7_a o8_a o9_a
gen Alc_Context0=o1_a +o2_a +o3_a+ o4_a +o5_a +o6_a +o7_a +o8_a +o9_a
gen Alc_Context3=o1_c +o2_c +o3_c+ o4_c +o5_c +o6_c +o7_c +o8_c +o9_c
gen Alc_Context6=o1_d +o2_d +o3_d+ o4_d +o5_d +o6_d +o7_d +o8_d +o9_d
gen Alc_Context9=o1_e +o2_e +o3_e+ o4_e +o5_e +o6_e +o7_e +o8_e +o9_e
gen Alc_Context12=o1_f +o2_f +o3_f+ o4_f +o5_f +o6_f +o7_f +o8_f +o9_f
replace Alc_Context3=. if missing3==1
replace Alc_Context6=. if missing6==1
replace Alc_Context9=. if missing9==1
replace Alc_Context12=. if missing12==1

*******

* Missing indicators
gen missing3=date_c==93
gen missing6=date_d==130
gen missing9=date_e==115
gen missing12=date_f==117

* Graduated high school
gen hsgrad0=a2_a==3 | a2_a==4 | a2_a==5
* Employed
gen job0=a5_a==2
gen job3=a5_c==2
gen job6=a5_d==2
gen job9=a5_e==2
gen job12=a5_f==2
* Current boyfriend
gen boyfriend0=f1_a==2
* Perceived partner concurrency
gen perceivedconcurrency0=f11_a==2
* Chlamydia
gen chlamydia0=Chlamydia_a==2
tab chlamydia0 Chlamydia_a
gen chlamydia3=Chlamydia_c==2
replace chlamydia3=. if missing3==1 | Chlamydia_c==3
tab chlamydia3 Chlamydia_c
gen chlamydia6=Chlamydia_d==2
replace chlamydia6=. if missing6==1 | Chlamydia_d==3
tab chlamydia6 Chlamydia_d
gen chlamydia9=Chlamydia_e==2
replace chlamydia9=. if missing9==1 | Chlamydia_e==3
tab chlamydia9 Chlamydia_e
gen chlamydia12=Chlamydia_f==2
replace chlamydia12=. if missing12==1 | Chlamydia_f==3
tab chlamydia12 Chlamydia_f
 
* Gonorrhea
gen gonorrhea0=Gonorrhea_a==2
gen gonorrhea3=Gonorrhea_c==2
replace gonorrhea3=. if missing3==1
gen gonorrhea6=Gonorrhea_d==2
replace gonorrhea6=. if missing6==1
gen gonorrhea9=Gonorrhea_e==2
replace gonorrhea9=. if missing9==1
gen gonorrhea12=Gonorrhea_f==2
replace gonorrhea12=. if missing12==1

* gen 
gen sti0=gonorrhea0==1 | chlamydia0==1
gen sti3=gonorrhea3==1 | chlamydia3==1
gen sti6=gonorrhea6==1 | chlamydia6==1
gen sti9=gonorrhea9==1 | chlamydia9==1
gen sti12=gonorrhea12==1 | chlamydia12==1
replace sti3=. if chlamydia3==.
replace sti6=. if chlamydia6==.
replace sti9=. if chlamydia9==.
replace sti12=. if chlamydia12==.

gen trich0=Trich_a==2
gen trich3=Trich_c==2
replace trich3=. if missing3==1
gen trich6=Trich_d==2
replace trich6=. if missing6==1
gen trich9=Trich_e==2
replace trich9=. if missing9==1
gen trich12=Trich_f==2
replace trich12=. if missing12==1

gen sti_trich0=gonorrhea0==1 | chlamydia0==1 | trich0==1
gen sti_trich3=gonorrhea3==1 | chlamydia3==1 | trich3==1
gen sti_trich6=gonorrhea6==1 | chlamydia6==1 | trich6==1
gen sti_trich9=gonorrhea9==1 | chlamydia9==1 | trich9==1
gen sti_trich12=gonorrhea12==1 | chlamydia12==1 | trich12==1
replace sti_trich3=. if chlamydia3==.
replace sti_trich6=. if chlamydia6==.
replace sti_trich9=. if chlamydia9==.
replace sti_trich12=. if chlamydia12==.
 
gen sti_count=chlamydia3 + chlamydia6 + chlamydia9 + chlamydia12 + gonorrhea3 + gonorrhea6 + gonorrhea9 + gonorrhea12 + trich3 + trich6 + trich9 + trich12

gen mult_sti3=(gonorrhea3 + chlamydia3 + trich3) > 1
gen mult_sti6=(gonorrhea6 + chlamydia6 + trich6) > 1
gen mult_sti9=(gonorrhea9 + chlamydia9 + trich9) > 1
gen mult_sti12=(gonorrhea12 + chlamydia12 + trich12) > 1
replace mult_sti3=. if chlamydia3==.
replace mult_sti6=. if chlamydia6==.
replace mult_sti9=. if chlamydia9==.
replace mult_sti12=. if chlamydia12==.

*tab2 chlamydia3 gonorrhea3 trich3



* chlamydia3 is defined as true if it's missing, so the first expression is wrong.  
*gen anychlamydia_a=chlamydia3 | chlamydia6 | chlamydia9 | chlamydia12
gen anychlamydia=chlamydia3==1 | chlamydia6==1 | chlamydia9==1 | chlamydia12==1
*tab anychlamydia_a anychlamydia_b

* Douching
gen everdouche0=d15_a==2
gen douche3m0=d16_a==1 | d16_a==2 | d16_a==3 | d16_a==4 

* Emotional abuse
gen everemotionalabuse0=bb1_a==2
gen everemotionalabuse3=bb1_c==2
replace everemotionalabuse3=. if bb1_c==3
gen everemotionalabuse6=bb1_d==2
replace everemotionalabuse6=. if bb1_d==3

gen everemotionalabuse9=bb1_e==2
replace everemotionalabuse9=. if bb1_e==3

gen everemotionalabuse12=bb1_f==2
replace everemotionalabuse12=. if bb1_f==3

gen emot_abuse_3m0=bb18_a==2
replace emot_abuse3m0=. if bb18_a==3 | bb18_a==4
gen emot_abuse_3m3=bb18_c==2
replace emot_abuse_3m3=. if bb18_c==3 | bb18_c==4
gen emot_abuse_3m6=bb18_d==2
replace emot_abuse_3m6=. if bb18_d==3 | bb18_d==4
gen emot_abuse_3m9=bb18_e==2
replace emot_abuse_3m9=. if bb18_e==3 | bb18_e==4
gen emot_abuse_3m12=bb18_f==2
replace emot_abuse_3m12=. if bb18_f==3 | bb18_f==4



* Physical abuse
gen everphysicalabuse0=bb3_a==2
gen everphysicalabuse3=bb3_c==2
replace everphysicalabuse3=. if bb3_c==3

gen everphysicalabuse6=bb3_d==2
replace everphysicalabuse6=. if bb3_d==3

gen everphysicalabuse9=bb3_e==2
replace everphysicalabuse9=. if bb3_e==3

gen everphysicalabuse12=bb3_f==2
replace everphysicalabuse12=. if bb3_f==3


** Abuse aggregate measure
gen partner_ever_push0=bb41_a>=2
gen partner_ever_punch0=bb42_a>=2
gen partner_ever_beats0=bb43_a>=2
factor partner_ever_push0 partner_ever_punch0 partner_ever_beats0
alpha partner_ever_push0 partner_ever_punch0 partner_ever_beats0
factor bb41_a bb42_a bb43_a, factors(1) 

factor bb41_a 

* Tried marijuana
gen evermarijuana0=b42_a==2



* Agreement across waves of ever coercion and ever sabotage items
tab e9_a e9_c
tab e9_a e9_d
tab e9_a e9_e
tab e9_a e9_f

* Create one variable for each item for each time period.
gen ever_toldnobc0=e9_a==2  
gen ever_toldnobc3=e9_c==2 
gen ever_toldnobc6=e9_d==2  
gen ever_toldnobc9=e9_e==2  
gen ever_toldnobc12=e9_f==2  
replace ever_toldnobc3=. if e9_c==3 
replace ever_toldnobc6=. if e9_d==3 
replace ever_toldnobc9=. if e9_e==3 
replace ever_toldnobc12=. if e9_f==3 

gen ever_threat_leave0=e11_a==2
gen ever_threat_leave3=e11_c==2
gen ever_threat_leave6=e11_d==2
gen ever_threat_leave9=e11_e==2
gen ever_threat_leave12=e11_f==2
replace ever_threat_leave3=. if e11_c==3
replace ever_threat_leave6=. if e11_d==3
replace ever_threat_leave9=. if e11_e==3
replace ever_threat_leave12=. if e11_f==3

gen ever_threat_someoneelse0=e13_a==2
gen ever_threat_someoneelse3=e13_c==2
gen ever_threat_someoneelse6=e13_d==2
gen ever_threat_someoneelse9=e13_e==2
gen ever_threat_someoneelse12=e13_f==2
replace ever_threat_someoneelse3=. if e13_c==3
replace ever_threat_someoneelse6=. if e13_d==3
replace ever_threat_someoneelse9=. if e13_e==3
replace ever_threat_someoneelse12=. if e13_f==3

gen ever_hurt_notagree0=e15_a==2
gen ever_hurt_notagree3=e15_c==2
gen ever_hurt_notagree6=e15_d==2
gen ever_hurt_notagree9=e15_e==2
gen ever_hurt_notagree12=e15_f==2
replace ever_hurt_notagree3=. if e15_c==3
replace ever_hurt_notagree6=. if e15_d==3
replace ever_hurt_notagree9=. if e15_e==3
replace ever_hurt_notagree12=. if e15_f==3

gen ever_takeoffcondom0=e17_a==2
gen ever_takeoffcondom3=e17_c==2
gen ever_takeoffcondom6=e17_d==2
gen ever_takeoffcondom9=e17_e==2
gen ever_takeoffcondom12=e17_f==2
replace ever_takeoffcondom3=. if e17_c==3
replace ever_takeoffcondom6=. if e17_d==3
replace ever_takeoffcondom9=. if e17_e==3
replace ever_takeoffcondom12=. if e17_f==3

gen ever_holescondom0=e19_a==2
gen ever_holescondom3=e19_c==2
gen ever_holescondom6=e19_d==2
gen ever_holescondom9=e19_e==2
gen ever_holescondom12=e19_f==2
replace ever_holescondom3=. if e19_c==3
replace ever_holescondom6=. if e19_d==3
replace ever_holescondom9=. if e19_e==3
replace ever_holescondom12=. if e19_f==3

gen ever_brokecondom0=e21_a==2
gen ever_brokecondom3=e21_c==2
gen ever_brokecondom6=e21_d==2
gen ever_brokecondom9=e21_e==2
gen ever_brokecondom12=e21_f==2
replace ever_brokecondom3=. if e21_c==3
replace ever_brokecondom6=. if e21_d==3
replace ever_brokecondom9=. if e21_e==3
replace ever_brokecondom12=. if e21_f==3

gen ever_tookbc0=e23_a==2
gen ever_tookbc3=e23_c==2
gen ever_tookbc6=e23_d==2
gen ever_tookbc9=e23_e==2
gen ever_tookbc12=e23_f==2
replace ever_tookbc3=. if e23_c==3
replace ever_tookbc6=. if e23_d==3
replace ever_tookbc9=. if e23_e==3
replace ever_tookbc12=. if e23_f==3

gen ever_forcednocondom0=e25_a==2
gen ever_forcednocondom3=e25_c==2
gen ever_forcednocondom6=e25_d==2
gen ever_forcednocondom9=e25_e==2
gen ever_forcednocondom12=e25_f==2
replace ever_forcednocondom3=. if e25_c==3
replace ever_forcednocondom6=. if e25_d==3
replace ever_forcednocondom9=. if e25_e==3
replace ever_forcednocondom12=. if e25_f==3

*** *** Past 3 months
 save "/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181019.dta", replace
** Only asked if people reported lifetime.
codebook e9_e e11_e e13_e e15_e e17_e e19_e e21_e e23_e e25_e

codebook e10_d e12_d e14_d e16_d e18_d e20_d e22_d e24_d e26_d
codebook e10_e e12_e e14_e e16_e e18_e e20_e e22_e e24_e e26_e
codebook e10_f e12_f e14_f e16_f e18_f e20_f e22_f e24_f e26_f

gen toldnobc3m0=e10_a==2  
gen toldnobc3m3=e10_c==2 
gen toldnobc3m6=e10_d==2  
gen toldnobc3m9=e10_e==2  
gen toldnobc3m12=e10_f==2  
replace toldnobc3m3=. if e10_c==3 
replace toldnobc3m6=. if e10_d==3
replace toldnobc3m9=. if e10_e==3 
replace toldnobc3m12=. if e10_f==3 
replace toldnobc3m3=0 if ever_toldnobc3==0
replace toldnobc3m6=0 if ever_toldnobc6==0
replace toldnobc3m9=0 if ever_toldnobc9==0
replace toldnobc3m12=0 if ever_toldnobc12==0

gen threat_leave3m0=e12_a==2
gen threat_leave3m3=e12_c==2
gen threat_leave3m6=e12_d==2
gen threat_leave3m9=e12_e==2
gen threat_leave3m12=e12_f==2
replace threat_leave3m3=. if e12_c==3
replace threat_leave3m6=. if e12_d==3
replace threat_leave3m9=. if e12_e==3
replace threat_leave3m12=. if e12_f==3
replace threat_leave3m3=0 if ever_threat_leave3==0
replace threat_leave3m6=0 if ever_threat_leave6==0
replace threat_leave3m9=0 if ever_threat_leave9==0
replace threat_leave3m12=0 if ever_threat_leave12==0

gen threat_someoneelse3m0=e14_a==2
gen threat_someoneelse3m3=e14_c==2
gen threat_someoneelse3m6=e14_d==2
gen threat_someoneelse3m9=e14_e==2
gen threat_someoneelse3m12=e14_f==2
replace threat_someoneelse3m3=. if e14_c==3
replace threat_someoneelse3m6=. if e14_d==3
replace threat_someoneelse3m9=. if e14_e==3
replace threat_someoneelse3m12=. if e14_f==3
replace threat_someoneelse3m3=0 if ever_threat_someoneelse3==0
replace threat_someoneelse3m6=0 if ever_threat_someoneelse6==0
replace threat_someoneelse3m9=0 if ever_threat_someoneelse9==0
replace threat_someoneelse3m12=0 if ever_threat_someoneelse12==0

gen hurt_notagree3m0=e16_a==2
gen hurt_notagree3m3=e16_c==2
gen hurt_notagree3m6=e16_d==2
gen hurt_notagree3m9=e16_e==2
gen hurt_notagree3m12=e16_f==2
replace hurt_notagree3m3=. if e16_c==3
replace hurt_notagree3m6=. if e16_d==3
replace hurt_notagree3m9=. if e16_e==3
replace hurt_notagree3m12=. if e16_f==3
replace hurt_notagree3m3=0 if ever_hurt_notagree3==0
replace hurt_notagree3m6=0 if ever_hurt_notagree6==0
replace hurt_notagree3m9=0 if ever_hurt_notagree9==0
replace hurt_notagree3m12=0 if ever_hurt_notagree12==0

gen takeoffcondom3m0=e18_a==2
gen takeoffcondom3m3=e18_c==2
gen takeoffcondom3m6=e18_d==2
gen takeoffcondom3m9=e18_e==2
gen takeoffcondom3m12=e18_f==2
replace takeoffcondom3m3=. if e18_c==3
replace takeoffcondom3m6=. if e18_d==3
replace takeoffcondom3m9=. if e18_e==3
replace takeoffcondom3m12=. if e18_f==3
replace takeoffcondom3m3=0 if ever_takeoffcondom3==0
replace takeoffcondom3m6=0 if ever_takeoffcondom6==0
replace takeoffcondom3m9=0 if ever_takeoffcondom9==0
replace takeoffcondom3m12=0 if ever_takeoffcondom12==0

gen holescondom3m0=e20_a==2
gen holescondom3m3=e20_c==2
gen holescondom3m6=e20_d==2
gen holescondom3m9=e20_e==2
gen holescondom3m12=e20_f==2
replace holescondom3m3=. if e20_c==3
replace holescondom3m6=. if e20_d==3
replace holescondom3m9=. if e20_e==3
replace holescondom3m12=. if e20_f==3
replace holescondom3m3=0 if ever_holescondom3==0
replace holescondom3m6=0 if ever_holescondom6==0
replace holescondom3m9=0 if ever_holescondom9==0
replace holescondom3m12=0 if ever_holescondom12==0

gen brokecondom3m0=e22_a==2
gen brokecondom3m3=e22_c==2
gen brokecondom3m6=e22_d==2
gen brokecondom3m9=e22_e==2
gen brokecondom3m12=e22_f==2
replace brokecondom3m3=. if e22_c==3
replace brokecondom3m6=. if e22_d==3
replace brokecondom3m9=. if e22_e==3
replace brokecondom3m12=. if e22_f==3
replace brokecondom3m3=0 if ever_brokecondom3==0
replace brokecondom3m6=0 if ever_brokecondom6==0
replace brokecondom3m9=0 if ever_brokecondom9==0
replace brokecondom3m12=0 if ever_brokecondom12==0

gen tookbc3m0=e24_a==2
gen tookbc3m3=e24_c==2
gen tookbc3m6=e24_d==2
gen tookbc3m9=e24_e==2
gen tookbc3m12=e24_f==2
replace tookbc3m3=. if e24_c==3
replace tookbc3m6=. if e24_d==3
replace tookbc3m9=. if e24_e==3
replace tookbc3m12=. if e24_f==3
replace tookbc3m3=0 if ever_tookbc3==0
replace tookbc3m6=0 if ever_tookbc6==0
replace tookbc3m9=0 if ever_tookbc9==0
replace tookbc3m12=0 if ever_tookbc12==0

gen forcednocondom3m0=e26_a==2
gen forcednocondom3m3=e26_c==2
gen forcednocondom3m6=e26_d==2
gen forcednocondom3m9=e26_e==2
gen forcednocondom3m12=e26_f==2
replace forcednocondom3m3=. if e26_c==3
replace forcednocondom3m6=. if e26_d==3
replace forcednocondom3m9=. if e26_e==3
replace forcednocondom3m12=. if e26_f==3
replace forcednocondom3m3=0 if ever_forcednocondom3==0
replace forcednocondom3m6=0 if ever_forcednocondom6==0
replace forcednocondom3m9=0 if ever_forcednocondom9==0
replace forcednocondom3m12=0 if ever_forcednocondom12==0


alpha ever_toldnobc0 ever_threat_leave0 ever_threat_someoneelse0 ever_hurt_notagree0 
alpha ever_takeoffcondom0 ever_holescondom0 ever_brokecondom0 ever_tookbc0 ever_forcednocondom0


alpha ever_toldnobc3 ever_threat_leave3 ever_threat_someoneelse3 ever_hurt_notagree3
alpha ever_takeoffcondom3 ever_holescondom3 ever_brokecondom3 ever_tookbc3 ever_forcednocondom3

** Past 3 months
alpha toldnobc3m0 threat_leave3m0 threat_someoneelse3m0 hurt_notagree3m0
alpha takeoffcondom3m0 holescondom3m0 brokecondom3m0 tookbc3m0 forcednocondom3m0

factor toldnobc3m0 threat_leave3m0 threat_someoneelse3m0 hurt_notagree3m0 takeoffcondom3m0 holescondom3m0 brokecondom3m0 tookbc3m0 forcednocondom3m0, factors(1)


alpha toldnobc3m3 threat_leave3m3 threat_someoneelse3m3 hurt_notagree3m3
alpha takeoffcondom3m3 holescondom3m3 brokecondom3m3 tookbc3m3 forcednocondom3m3

factor toldnobc3m3 threat_leave3m3 threat_someoneelse3m3 hurt_notagree3m3 takeoffcondom3m3 holescondom3m3 brokecondom3m3 tookbc3m3 forcednocondom3m3, factors(1)



alpha toldnobc3m6 threat_leave3m6 threat_someoneelse3m6 hurt_notagree3m6
alpha takeoffcondom3m6 holescondom3m6 brokecondom3m6 tookbc3m6 forcednocondom3m6

alpha toldnobc3m9 threat_leave3m9 threat_someoneelse3m9 hurt_notagree3m9
alpha takeoffcondom3m9 holescondom3m9 brokecondom3m9 tookbc3m9 forcednocondom3m9

** For them together:
alpha toldnobc3m0 threat_leave3m0 threat_someoneelse3m0 hurt_notagree3m0 takeoffcondom3m0 holescondom3m0 brokecondom3m0 tookbc3m0 forcednocondom3m0

alpha toldnobc3m3 threat_leave3m3 threat_someoneelse3m3 hurt_notagree3m3 takeoffcondom3m3 holescondom3m3 brokecondom3m3 tookbc3m3 forcednocondom3m3

alpha toldnobc3m6 threat_leave3m6 threat_someoneelse3m6 hurt_notagree3m6 takeoffcondom3m6 holescondom3m6 brokecondom3m6 tookbc3m6 forcednocondom3m6

alpha toldnobc3m9 threat_leave3m9 threat_someoneelse3m9 hurt_notagree3m9 takeoffcondom3m9 holescondom3m9 brokecondom3m9 tookbc3m9 forcednocondom3m9

alpha toldnobc3m12 threat_leave3m12 threat_someoneelse3m12 hurt_notagree3m12 takeoffcondom3m12 holescondom3m12 brokecondom3m12 tookbc3m12 forcednocondom3m12

** Is 12 month measure still almost always missing?  OR just close to 0 becaues of low reports of lifeitme prevalence?  
alpha toldnobc3m12 threat_leave3m12 threat_someoneelse3m12 hurt_notagree3m12
alpha takeoffcondom3m12 holescondom3m12 brokecondom3m12 tookbc3m12 forcednocondom3m12

tab1 toldnobc3m12 threat_leave3m12 threat_someoneelse3m12 hurt_notagree3m12
tab1 takeoffcondom3m12 holescondom3m12 brokecondom3m12 tookbc3m12 forcednocondom3m12

* Almost always lifeitme prevalence is low.  
codebook e9_f e11_f e13_f e15_f e17_f e19_f e21_f e23_f e25_f
codebook e10_f e12_f e14_f e16_f e18_f e20_f e22_f e24_f e26_f
tab e9_f e10_f
tab e11_f e12_f
tab e13_f e14_f
tab e15_f e16_f
tab e17_f e18_f
tab e19_f e20_f
tab e21_f e22_f
tab e23_f e24_f
tab e25_f e26_f


* Reshape data for Cochran's Q
reshape long ever_toldnobc ever_threat_leave ever_threat_someoneelse ever_hurt_notagree ever_takeoffcondom ever_holescondom ever_brokecondom ever_tookbc ever_forcednocondom, i(ID) j(wave)
cochranq ever_toldnobc ID wave, ma(holm) es(bjm)
* Never mind.  It doesn't work.

* Coercion
gen evercoercion0=e9_a==2 | e11_a==2 | e13_a==2 | e15_a==2 
gen evercoercion3=e9_c==2 | e11_c==2 | e13_c==2 | e15_c==2 
gen evercoercion6=e9_d==2 | e11_d==2 | e13_d==2 | e15_d==2 
gen evercoercion9=e9_e==2 | e11_e==2 | e13_e==2 | e15_e==2 
gen evercoercion12=e9_f==2 | e11_f==2 | e13_f==2 | e15_f==2 
replace evercoercion3=. if missing3==1


gen coercion3m0=e10_a==2 | e12_a==2 | e14_a==2 | e16_a==2 
gen coercion3m3=e10_c==2 | e12_c==2 | e14_c==2 | e16_c==2 
gen coercion3m6=e10_d==2 | e12_d==2 | e14_d==2 | e16_d==2 
gen coercion3m9=e10_e==2 | e12_e==2 | e14_e==2 | e16_e==2 
gen coercion3m12=e10_f==2 | e12_f==2 | e14_f==2 | e16_f==2 


* Sabotage
gen eversabotage0=e17_a==2| e19_a==2 | e21_a==2| e23_a==2 | e25_a==2 
gen eversabotage3=e17_c==2| e19_c==2 | e21_c==2| e23_c==2 | e25_c==2 
gen eversabotage6=e17_d==2| e19_d==2 | e21_d==2| e23_d==2 | e25_d==2 
gen eversabotage9=e17_e==2| e19_e==2 | e21_e==2| e23_e==2 | e25_e==2 
gen eversabotage12=e17_f==2| e19_f==2 | e21_f==2| e23_f==2 | e25_f==2 

gen sabotage3m0=e18_a==2| e20_a==2 | e22_a==2| e24_a==2 | e26_a==2 
gen sabotage3m3=e18_c==2| e20_c==2 | e22_c==2| e24_c==2 | e26_c==2 
gen sabotage3m6=e18_d==2| e20_d==2 | e22_d==2| e24_d==2 | e26_d==2 
gen sabotage3m9=e18_e==2| e20_e==2 | e22_e==2| e24_e==2 | e26_e==2 
gen sabotage3m12=e18_f==2| e20_f==2 | e22_f==2| e24_f==2 | e26_f==2 


* Reproductive coercion:  all 9 measures together.
codebook e9_a e11_a e13_a e15_a e17_a e19_a e21_a e23_a e25_a
gen reprodcoercion0=e9_a==2 | e11_a==2 | e13_a==2 | e15_a==2 | e17_a==2| e19_a==2 | e21_a==2| e23_a==2 | e25_a==2 
tab reprodcoercion0
gen reprodcoercion3=evercoercion3 | eversabotage3
gen reprodcoercion6=evercoercion6 | eversabotage6
gen reprodcoercion9=evercoercion9 | eversabotage9
gen reprodcoercion12=evercoercion12 | eversabotage12




gen reprodcoercion3m0=e10_a==2 | e12_a==2 | e14_a==2 | e16_a==2 | e18_a==2| e20_a==2 | e22_a==2| e24_a==2 | e26_a==2 
tab reprodcoercion3m0



gen reprodcoercion3m3=e10_c==2 | e12_c==2 | e14_c==2 | e16_c==2 | e18_c==2| e20_c==2 | e22_c==2| e24_c==2 | e26_c==2 
tab reprodcoercion3m3
gen reprodcoercion3m6=e10_d==2 | e12_d==2 | e14_d==2 | e16_d==2 | e18_d==2| e20_d==2 | e22_d==2| e24_d==2 | e26_d==2 
tab reprodcoercion3m6
gen reprodcoercion3m9=e10_e==2 | e12_e==2 | e14_e==2 | e16_e==2 | e18_e==2| e20_e==2 | e22_e==2| e24_e==2 | e26_e==2 
tab reprodcoercion3m9
gen reprodcoercion3m12=e10_f==2 | e12_f==2 | e14_f==2 | e16_f==2 | e18_f==2| e20_f==2 | e22_f==2| e24_f==2 | e26_f==2 
tab reprodcoercion3m12
replace reprodcoercion3m3=. if missing3==1
replace reprodcoercion3m6=. if missing6==1
replace reprodcoercion3m9=. if missing9==1
replace reprodcoercion3m12=. if missing12==1

replace reprodcoercion3=. if missing3==1
replace reprodcoercion6=. if missing6==1
replace reprodcoercion9=. if missing9==1
replace reprodcoercion12=. if missing12==1

* Multivariate regression with GEE
gen audit3=audit3m
gen audit6=audit6m
gen audit9=audit9m
gen audit12=audit12m
gen auditzone3=auditzone3m
gen auditzone6=auditzone6m
gen auditzone9=auditzone9m
gen auditzone12=auditzone12m


gen safesex_all= (safesex3==1) & (safesex6==1) & (safesex9==1) & (safesex12==1)
gen safesex_any= (safesex3==1) | (safesex6==1) | (safesex9==1) | (safesex12==1)

* 0% condom use
gen nevercondom_all= (nevercondom3==1) & (nevercondom6==1) & (nevercondom9==1) & (nevercondom12==1)
gen nevercondom_count= (nevercondom3==1) + (nevercondom6==1) + (nevercondom9==1) + (nevercondom12==1)

** STI
gen chlam3=chlamydia3
replace chlam3=0 if chlamydia3==.
gen chlam6=chlamydia6
replace chlam6=0 if chlamydia6==.
gen chlam9=chlamydia9
replace chlam9=0 if chlamydia9==.
gen chlam12=chlamydia12
replace chlam12=0 if chlamydia12==.
gen n_ct=chlam3 + chlam6 + chlam9 + chlam12
replace n_ct=. if missing3==1 & missing6==1 & missing9==1 & missing12==1



gen anysti0=chlamydia0==1 | gonorrhea0==1 | trich0==1
gen anysti3=chlamydia3==1 | gonorrhea3==1 | trich3==1
gen anysti6=chlamydia6==1 | gonorrhea6==1 | trich6==1
gen anysti9=chlamydia9==1 | gonorrhea9==1 | trich9==1
gen anysti12=chlamydia12==1 | gonorrhea12==1 | trich12==1
replace anysti3=. if missing3==1
replace anysti6=. if missing6==1
replace anysti9=. if missing9==1
replace anysti12=. if missing12==1

gen anysti=anysti3==1 | anysti6==1 |anysti9==1 | anysti12==1
gen anyct=chlamydia3==1 | chlamydia6==1 | chlamydia9==1 | chlamydia12==1
gen anyng=gonorrhea3==1 | gonorrhea6==1 | gonorrhea9==1 | gonorrhea12==1
replace anysti=. if missing3==1 & missing6==1 & missing9==1 & missing12==1
replace anyct=. if missing3==1 & missing6==1 & missing9==1 & missing12==1
replace anyng=. if missing3==1 & missing6==1 & missing9==1 & missing12==1

gen anytrich=trich3==1 | trich6==1 | trich9==1 | trich12==1
replace anytrich=. if missing3==1 & missing6==1 & missing9==1 & missing12==1

gen condom_tertile0=0*(condomuse0==0) + 0.5*(condomuse0!=0 & condomuse0!=1) +1*(condomuse0==1)
gen condom_tertile3=0*(condomuse3==0) + 0.5*(condomuse3!=0 & condomuse3!=1) +1*(condomuse3==1)
gen condom_tertile6=0*(condomuse6==0) + 0.5*(condomuse6!=0 & condomuse6!=1) +1*(condomuse6==1)
gen condom_tertile9=0*(condomuse9==0) + 0.5*(condomuse9!=0 & condomuse9!=1) +1*(condomuse9==1)
gen condom_tertile12=0*(condomuse12==0) + 0.5*(condomuse12!=0 & condomuse12!=1) +1*(condomuse12==1)

replace condom_tertile3=. if missing3==1
replace condom_tertile6=. if missing6==1
replace condom_tertile9=. if missing9==1
replace condom_tertile12=. if missing12==1


*contrast months@treat, effect
*margin months, over(treat)

* Try defining condom use manually to see if I can increase sample size. c6/c5
tab times_sex3 c5_c
tab c6_c
* missing 128 times
gen times_condom3=c6_c
replace times_condom3=. if c6_c==999
* missing 118
tab times_sex3, missing
gen propcondom3=times_condom3/times_sex3
replace propcondom3=1 if times_sex3==0
gen test_propcondom3=propcondom3==PropCU_c
tab test_propcondom3, missing
gen test_propcondom3b=propcondom3==condomuse3
tab test_propcondom3b, missing

* Try defining proportion condom use to make sure I'm doing this right
gen condomuse0=PropCU_a
gen condomuse3=PropCU_c
gen condomuse6=PropCU_d
gen condomuse9=PropCU_e
gen condomuse12=PropCU_f
replace condomuse3=1 if times_sex3==0
replace condomuse6=1 if times_sex6==0
replace condomuse9=1 if times_sex9==0
replace condomuse12=1 if times_sex12==0

tab1 times_condom0 times_sex0 if condomuse0==.

*** Try defining proportion condom use again
drop condomuse0 condomuse3 condomuse6 condomuse9 condomuse12
gen times_condom0=c6_a
replace times_condom0=. if c6_a==999
gen times_condom6=c6_d
replace times_condom6=. if c6_d==999
gen times_condom9=c6_e
replace times_condom9=. if c6_e==999
gen times_condom12=c6_f
replace times_condom12=. if c6_f==999
gen condomuse0=times_condom0/times_sex0
replace condomuse0=1 if times_sex0==0
gen condomuse3=times_condom3/times_sex3
replace condomuse3=1 if times_sex3==0
gen condomuse6=times_condom6/times_sex6
replace condomuse6=1 if times_sex6==0
gen condomuse9=times_condom9/times_sex9
replace condomuse9=1 if times_sex9==0
gen condomuse12=times_condom12/times_sex12
replace condomuse12=1 if times_sex12==0


*reshape long condomuse, i(ID) j(months)

* Components of condom use:  impute each separately.
* c3 lifetime partners, 
gen lifetime_partners0=c3_a
gen lifetime_partners3=c3_c
replace lifetime_partners3=. if c3_c==. | c3_c==999
gen lifetime_partners6=c3_d
replace lifetime_partners6=. if c3_d==. | c3_d==999
gen lifetime_partners9=c3_e
replace lifetime_partners9=. if c3_e==. | c3_e==999
gen lifetime_partners12=c3_f
replace lifetime_partners12=. if c3_f==. | c3_f==999

*** HUGE rates of inconsistent reporting of lifetime partners.  Ugh.
gen partner_inconsistent3=lifetime_partners3<lifetime_partners0
replace partner_inconsistent3=. if lifetime_partners3==.
gen partner_inconsistent6=lifetime_partners6<lifetime_partners3 | lifetime_partners6<lifetime_partners0
replace partner_inconsistent6=. if lifetime_partners6==.
gen partner_inconsistent9=lifetime_partners9< lifetime_partners6 | lifetime_partners9 < lifetime_partners3 | lifetime_partners9<lifetime_partners0
replace partner_inconsistent9=. if lifetime_partners9==.
gen partner_inconsistent12=lifetime_partners12<lifetime_partners9 | lifetime_partners12<lifetime_partners6 | lifetime_partners12 < lifetime_partners3 | lifetime_partners12<lifetime_partners0
replace partner_inconsistent12=. if lifetime_partners12==.

foreach x in partner_inconsistent3 partner_inconsistent6 partner_inconsistent9 partner_inconsistent12 {
	tab1 `x'
}

* Partners in past 3 months
gen recentpartners0=c4_a
replace recentpartners0=. if c4_a==999
gen recentpartners3=c4_c
replace recentpartners3=. if c4_c==999
gen recentpartners6=c4_d
replace recentpartners6=. if c4_d==999
gen recentpartners9=c4_e
replace recentpartners9=. if c4_e==999
gen recentpartners12=c4_f
replace recentpartners12=. if c4_f==999

gen recent_monogamy0=recentpartners0==1

gen diff_partners3=lifetime_partners3-lifetime_partners0
gen diff_partners6=lifetime_partners6-lifetime_partners3
gen diff_partners9=lifetime_partners9-lifetime_partners6
gen diff_partners12=lifetime_partners12-lifetime_partners9
scatter diff_partners3 recentpartners3
regress diff_partners3 recentpartners3
scatter diff_partners6 recentpartners6
regress diff_partners6 recentpartners6
scatter diff_partners9 recentpartners9
regress diff_partners9 recentpartners9
scatter diff_partners12 recentpartners12
regress diff_partners12 recentpartners12

*  Times sex in past 3 months
gen times_sex0= c5_a
gen times_sex3=c5_c
replace times_sex3=. if c5_c==999
gen times_sex6=c5_d
replace times_sex6=. if c5_d==999
gen times_sex9=c5_e
replace times_sex9=. if c5_e==999
gen times_sex12=c5_f
replace times_sex12=. if c5_f==999

* Times condoms in past 3 months
gen times_condoms0=c6_a
gen times_condoms3=c6_c
replace times_condoms3=. if c6_c==999
gen times_condoms6=c6_d
replace times_condoms6=. if c6_d==999
gen times_condoms9=c6_e
replace times_condoms9=. if c6_e==999
gen times_condoms12=c6_f
replace times_condoms12=. if c6_f==999


* Safe sex
gen abstain90d0=c4_a==0
replace abstain90d0=. if c4_a==999
gen abstain90d3=c4_c==0
replace abstain90d3=. if c4_c==999
gen abstain90d6=c4_d==0
replace abstain90d6=. if c4_d==999
gen abstain90d9=c4_e==0
replace abstain90d9=. if c4_e==999
gen abstain90d12=c4_f==0
replace abstain90d12=. if c4_f==999

gen safesex0=abstain90d0==1 | condomuse0==1
gen safesex3=abstain90d3==1 | condomuse3==1
gen safesex6=abstain90d6==1 | condomuse6==1
gen safesex9=abstain90d9==1 | condomuse9==1
gen safesex12=abstain90d12==1 | condomuse12==1
replace safesex3=. if missing3==1
replace safesex6=. if missing6==1
replace safesex9=. if missing9==1
replace safesex12=. if missing12==1

gen nevercondom0=abstain90d0==0 & condomuse0==0
gen nevercondom3=abstain90d3==0 &condomuse3==0
gen nevercondom6=abstain90d6==0 & condomuse6==0
gen nevercondom9=abstain90d9==0 &condomuse9==0
gen nevercondom12=abstain90d12==0 &condomuse12==0
replace nevercondom3=. if missing3==1
replace nevercondom6=. if missing6==1
replace nevercondom9=. if missing9==1
replace nevercondom12=. if missing12==1

gen horizonsgmet=treat==3
gen gmet=treat==3
replace gmet=. if treat==1


* current relationship duration
histogram f3_a
gen relationshiplength0=f3_a
replace relationshiplength0=. if f3_a==999

gen sexpartnerage0=.
replace sexpartnerage0=1 if c1_a==1 | c1_a==2 | c1_a==3
replace sexpartnerage0=2 if c1_a==4
replace sexpartnerage0=3 if c1_a==5

gen sexpartner_older0=sexpartnerage0==2
gen sexpartner_mucholder0=sexpartnerage0==3

* Secondary abstinence

* Define measures
gen preg3=pp1_c==2
replace preg3=. if pp1_c==3 | pp1_c==4
gen preg6=pp1_d==2
replace preg6=. if pp1_d==3 | pp1_d==4
gen preg9=pp1_e==2
replace preg9=. if pp1_e==3 | pp1_e==4
gen preg12=pp1_f==1
replace preg12=. if pp1_f==99 | pp1_f==999


replace preg3=0 if everpreg3==0 & preg3==.
replace preg6=0 if everpreg6==0 & preg6==.
replace preg9=0 if everpreg9==0 & preg9==.
replace preg12=0 if everpreg12==0 & preg12==.

tab preg3 missing3, missing
tab preg6 missing6, missing
tab preg9 missing9, missing
tab preg12 missing12, missing

tab preg3 pp2_c, missing

* Check if pregancy is associated with missingness in next wave
* No, it's not.
tab preg3 missing6,  row chi2
tab preg6 missing9,  row chi2
tab preg9 missing12,  row chi2

* Check if coercion is associated with missingness in next wave
* No, it's not.
tab reprodcoercion3m0 missing3,  row chi2
tab reprodcoercion3m3 missing6,  row chi2
tab reprodcoercion3m6 missing9,  row chi2
tab reprodcoercion3m9 missing12,  row chi2

** Look for agreement between reproductive coercion measures between waves


* 

* Fertility intentions prior to pregnancy
* 1 I wanted to be pregnant sooner
* 2 I wanted to be pregnant later
* 3 I wanted to be pregnant then
* 4 I didn’t want to be pregnant then or at any time in the future

tab pp5_d reprodcoercion3m3 if preg6==1, col exact
tab pp5_e reprodcoercion3m6 if preg9==1, col exact
tab pp5_f reprodcoercion3m9 if preg12==1, col exact

* Unwanted vs. mistimed

gen preg_unwanted6=(pp5_d==4)
gen preg_unwanted9=(pp5_e==4)
gen preg_unwanted12=(pp5_f==4)
replace preg_unwanted6=. if pp5_d==5 | pp5_d==6
replace preg_unwanted9=. if pp5_e==5 | pp5_e==6
replace preg_unwanted12=. if pp5_f==5 | pp5_f==6

tab preg_unwanted6 reprodcoercion3m3, col exact
tab preg_unwanted9 reprodcoercion3m6, col exact
tab preg_unwanted12 reprodcoercion3m9, col exact


* Wanted to be pregnant sooner or then:
gen preg_wanted3=(pp5_c==1 | pp5_c==3)
gen preg_wanted6=(pp5_d==1 | pp5_d==3)
gen preg_wanted9=(pp5_e==1 | pp5_e==3)
gen preg_wanted12=(pp5_f==1 | pp5_f==3)
replace preg_wanted3=. if pp5_c==5 | pp5_c==6
replace preg_wanted6=. if pp5_d==5 | pp5_d==6
replace preg_wanted9=. if pp5_e==5 | pp5_e==6
replace preg_wanted12=. if pp5_f==5 | pp5_f==6

tab preg_wanted6 reprodcoercion3m3, col exact
tab preg_wanted9 reprodcoercion3m6, col exact
tab preg_wanted12 reprodcoercion3m9, col exact

* 

tab pp5_d reprodcoercion3m3 if preg6==1, col
tab pp5_e reprodcoercion3m6 if preg9==1, col
tab pp5_f reprodcoercion3m9 if preg12==1, col

* Prenatal care
tab pp3_d reprodcoercion3m3 if preg6==1, col exact
tab pp3_e reprodcoercion3m6 if preg9==1, col exact
tab pp3_f reprodcoercion3m9 if preg12==1, col exact

* Due date versus current date.
* convert dates to stata date
* Dates are stored as integers, and not consecutive.  
tab date_d
tab date_e
tab date_f
describe date_d
codebook date_d
label list date_d

decode date_d, generate(date6)
 describe date6
gen datedate6=date(date6, "MD20Y")

decode date_e, generate(date9)
 describe date9
gen datedate9=date(date9, "MD20Y")

decode date_f, generate(date12)
 describe date12
gen datedate12=date(date12, "MD20Y")

* length of pregnancy
*gen due6=pp4_d
label list pp4_d
replace pp4_d=. if pp4_d==25 | pp4_d==26 | pp4_d==27 | pp4_d==28
label list pp4_e
replace pp4_e=. if pp4_e==21 | pp4_e==22
label list pp4_f
replace pp4_f=. if pp4_f==32 | pp4_f==33 | pp4_f==34

decode pp4_d, generate(due6)
decode pp4_e, generate(due9)
decode pp4_f, generate(due12)
gen duedate6=date(due6, "MD20Y")
gen duedate9=date(due9, "MD20Y")
gen duedate12=date(due12, "MD20Y")

gen days_until_due12=duedate12-datedate12
gen days_until_due9=duedate9-datedate9
gen days_until_due6=duedate6-datedate6

gen weeks_preg6=round((280-days_until_due6)/7)
gen weeks_preg9=round((280-days_until_due9)/7)
gen weeks_preg12=round((280-days_until_due12)/7)

tab1 weeks_preg*
centile weeks_preg*, centile(25, 50, 75)

* Fertility intentions
gen ttc0=e1_a==2
gen ttc3=e1_c==2
replace ttc3=. if e1_c==3
gen ttc6=e1_d==2
replace ttc6=. if e1_d==3
gen ttc9=e1_e==2
replace ttc9=. if e1_e==3
gen ttc12=e1_f==2
replace ttc12=. if e1_f==3

* Ever pregnant
* If missing, use last value carried forward???
gen everpreg0=e2_a==2
gen everpreg3=e2_c==2
replace everpreg3=. if e2_c==3
gen everpreg6=e2_d==2
replace everpreg6=. if e2_d==3
gen everpreg9=e2_e==2
replace everpreg9=. if e2_e==3
gen everpreg12=e2_f==2
replace everpreg12=. if e2_f==3

tab everpreg0 everpreg3

tab everpreg0 e4_a, missing

* Ever gave birth
codebook qq1_*

*drop ever_birth0
gen ever_birth0=qq1_a==2
replace ever_birth0=. if qq1_a==. | qq1_a==3
tab ever_birth0 qq1_a
*replace ever_birth0=1 if e4_a==2 & ever_birth0==.
tab e4_a ever_birth0, missing
tab children0 ever_birth0, missing


* Emergency contraception
codebook e8_a


* Children
* Are skip patterns from e2?  Yes.  
tab e2_a e4_a, missing
drop children0 children3 children6 children9 children12
gen children0=e4_a==2
replace children0=0 if everpreg0==0 
tab children0 everpreg0, missing

gen children3=e4_c==2
tab e4_c everpreg3, missing
replace children3=0 if everpreg3==0 
tab children3 e4_c, missing
replace children3=. if everpreg3==.

gen children6=e4_d==2
tab e4_d children6, missing
replace children6=0 if everpreg6==0 & children6==.
tab children6 e4_d, missing
replace children6=. if everpreg6==.
tab children6 e4_d, missing

* Why are so many missing?  
gen children9=e4_e==2
tab children9 e4_e, missing
tab children9 everpreg9, missing
*replace children9=. if e4_e==3 & 
replace children9=0 if everpreg9==0 
replace children9=. if everpreg9==.
*replace children9=0 if everpreg6==0 & children6==0
*replace children9=0 if everpreg3==0 & children3==0
*replace children9=0 if everpreg0==0 & children0==0

gen children12=e4_f==2
tab children12 e4_f, missing
*replace children12=. if e4_f==3
replace children12=0 if everpreg12==0
replace children12=. if everpreg12==.
*replace children12=0 if everpreg9==0 & children9==0

tab1 children*
gen retract_children3=children3==0 & children0==1
gen retract_children6=children6==0 & children0==1
gen retract_children9=children9==0 & children0==1
gen retract_children12=children12==0 & children0==1

tab children0
tab1 retract_children* if children0==1


* Never pregnant but have children

* Ever abortion
gen ever_abortion0=gg20_a==2
replace ever_abortion0=. if gg20_a==3
tab gg20_a everpreg0, missing

gen ever_abortion3=gg20_c==2
replace ever_abortion3=. if gg20_c==3 | gg20_c==4
gen ever_abortion6=gg20_d==2
replace ever_abortion6=. if gg20_d==3 | gg20_d==4
gen ever_abortion9=gg20_e==2
replace ever_abortion9=. if gg20_e==3 | gg20_e==4
gen ever_abortion12=gg20_f==2
replace ever_abortion12=. if gg20_f==3 | gg20_f==4

* Recant abortion
gen recant_abortion3=(ever_abortion3==0 & ever_abortion0==1)
replace recant_abortion3=. if ever_abortion3==.
gen recant_abortion6=(ever_abortion6==0 & ever_abortion3==1)
replace recant_abortion6=. if ever_abortion6==. | ever_abortion3==.
gen recant_abortion9=(ever_abortion9==0 & ever_abortion6==1)
replace recant_abortion9=. if ever_abortion9==. | ever_abortion6==.
gen recant_abortion12=(ever_abortion12==0 & ever_abortion9==1)
replace recant_abortion12=. if ever_abortion12==. | ever_abortion9==.

tab ever_abortion0
tab1 recant_abortion* if ever_abortion0==1



* recanting of coercion
gen recant_coercion3=evercoercion3==0 & evercoercion0==1
replace recant_coercion3=. if evercoercion3==. | evercoercion0==.
gen recant_coercion6=evercoercion6==0 & evercoercion3==1
replace recant_coercion6=. if evercoercion6==. | evercoercion3==.
gen recant_coercion9=evercoercion9==0 & evercoercion6==1
replace recant_coercion9=. if evercoercion9==. | evercoercion6==.
gen recant_coercion12=evercoercion12==0 & evercoercion9==1
replace recant_coercion12=. if evercoercion12==. | evercoercion9==.

tab1 recant_coercion*

gen recant_sabotage3=eversabotage3==0 & eversabotage0==1
replace recant_sabotage3=. if eversabotage3==. | eversabotage0==.
gen recant_sabotage6=eversabotage6==0 & eversabotage3==1
replace recant_sabotage6=. if eversabotage6==. | eversabotage3==.
gen recant_sabotage9=eversabotage9==0 & eversabotage6==1
replace recant_sabotage9=. if eversabotage9==. | eversabotage6==.
gen recant_sabotage12=eversabotage12==0 & eversabotage9==1
replace recant_sabotage12=. if eversabotage12==. | eversabotage9==.

tab1 recant_sabotage*

*recanting of either

gen recant_reprodcoercion3=reprodcoercion3==0 & reprodcoercion0==1
replace recant_reprodcoercion3=. if reprodcoercion3==. | reprodcoercion0==.
gen recant_reprodcoercion6=reprodcoercion6==0 & reprodcoercion3==1
replace recant_reprodcoercion6=. if reprodcoercion6==. | reprodcoercion3==.
gen recant_reprodcoercion9=reprodcoercion9==0 & reprodcoercion6==1
replace recant_reprodcoercion9=. if reprodcoercion9==. | reprodcoercion6==.
gen recant_reprodcoercion12=reprodcoercion12==0 & reprodcoercion9==1
replace recant_reprodcoercion12=. if reprodcoercion12==. | reprodcoercion9==.
tab1 recant_reprodcoercion*

* recanting of current pregancy
tab preg3 preg6
tab preg6 preg9
tab preg9 preg12


gen recant_preg6=preg6==0 & preg3==1
replace recant_preg6=. if preg6==. | preg3==.
gen recant_preg9=preg9==0 & preg6==1
replace recant_preg9=. if preg9==. | preg6==.
gen recant_preg12=preg12==0 & preg9==1
replace recant_preg12=. if preg12==. | preg9==.

tab recant_preg6 ever_abortion6, missing
tab recant_preg9 ever_abortion9, missing
tab recant_preg12 ever_abortion12, missing

** Perinatal alcohol use



#### 4/14/19 Among unplanned pregnancies, how many are reproductive coercion
tab  preg_wanted3 reprodcoercion3m0, row exact
tab  preg_wanted6 reprodcoercion3m3, row exact
tab  preg_wanted9 reprodcoercion3m6, row exact
tab  preg_wanted12 reprodcoercion3m9, row exact

## Any new children born after reproductive coercion? 



******* Variables that can be recanted:

* These are all rare:
gen ever_cocaine0=b34_a==2
tab ever_cocaine0 b34_a
gen ever_meth0=b36_a==2
tab ever_meth0 b36_a
gen ever_inhalants0=b38_a==2
tab ever_inhalants0 b38_a
gen ever_shareneedle0=b40_a==2
tab ever_shareneedle0 b40_a

*These are common
gen ever_marijuana0=b42_a==2
tab ever_marijuana0 b42_a
gen ever_marijuana3=b42_c==2
tab ever_marijuana3 b42_c
replace ever_marijuana3=. if b42_c==3
gen ever_marijuana6=b42_d==2
tab ever_marijuana6 b42_d
replace ever_marijuana6=. if b42_d==3
gen ever_marijuana9=b42_e==2
tab ever_marijuana9 b42_e
replace ever_marijuana9=. if b42_e==3
gen ever_marijuana12=b42_f==2
tab ever_marijuana12 b42_f
replace ever_marijuana12=. if b42_f==3

* There are 4 follow-up time points
tab  ever_marijuana3 ever_marijuana0, col
tab ever_marijuana6 ever_marijuana0 , col
tab  ever_marijuana6 ever_marijuana3 if ever_marijuana0==1, col
tab  ever_marijuana6 ever_marijuana3 if ever_marijuana0==0, col

tab ever_marijuana9 ever_marijuana0 , col
tab ever_marijuana12  ever_marijuana0 , col

tab ever_marijuana*


gen ever_analsex0=c14_a==2
tab ever_analsex0 c14_a
gen ever_analsex3=c14_c==2
tab ever_analsex3 c14_c
replace ever_analsex3=. if c14_c==3
gen ever_analsex6=c14_d==2
tab ever_analsex6 c14_d
replace ever_analsex6=. if c14_d==3
gen ever_analsex9=c14_e==2
tab ever_analsex9 c14_e
replace ever_analsex9=. if c14_e==3
gen ever_analsex12=c14_f==2
tab ever_analsex12 c14_f
replace ever_analsex12=. if c14_f==3


tab1 ever_analsex0 ever_analsex3 ever_analsex6 ever_analsex9 ever_analsex12


*** Oral sex

gen ever_oralsex0=c20_a==2
tab ever_oralsex0 c20_a
gen ever_oralsex3=c20_c==2
tab ever_oralsex3 c20_c
replace ever_oralsex3=. if c20_c==3
gen ever_oralsex6=c20_d==2
tab ever_oralsex6 c20_d
replace ever_oralsex6=. if c20_d==3
gen ever_oralsex9=c20_e==2
tab ever_oralsex9 c20_e
replace ever_oralsex9=. if c20_e==3
gen ever_oralsex12=c20_f==2
tab ever_oralsex12 c20_f
replace ever_oralsex12=. if c20_f==3

tab1 ever_oralsex*



***** Ever STI

gen ever_sti0=d6_a==2
tab ever_sti0 d6_a
gen ever_sti3=d6_c==2
tab ever_sti3 d6_c
replace ever_sti3=. if d6_c==3
gen ever_sti6=d6_d==2
tab ever_sti6 d6_d
replace ever_sti6=. if d6_d==3
gen ever_sti9=d6_e==2
tab ever_sti9 d6_e
replace ever_sti9=. if d6_e==3
gen ever_sti12=d6_f==2
tab ever_sti12 d6_f
replace ever_sti12=. if d6_f==3


**** Douching
*gen everdouche0=d15_a==2
gen everdouche3=d15_c==2
replace everdouche3=. if d15_c==3
gen everdouche6=d15_d==2
replace everdouche6=. if d15_d==3
gen everdouche9=d15_e==2
replace everdouche9=. if d15_e==3
gen everdouche12=d15_f==2
replace everdouche12=. if d15_f==3
tab everdouche12 d15_f


*emergency contraception:  1 if yes, 0 for no or don't know
gen ever_ec0=e6_a==2
tab ever_ec0 e6_a
gen ever_ec3=e6_c==2
tab ever_ec3 e6_c
replace ever_ec3=. if e6_c==3
gen ever_ec6=e6_d==2
tab ever_ec6 e6_d
replace ever_ec6=. if e6_d==3
gen ever_ec9=e6_e==2
tab ever_ec9 e6_e
replace ever_ec9=. if e6_e==3
gen ever_ec12=e6_f==2
tab ever_ec12 e6_f
replace ever_ec12=. if e6_f==3

gen retract_ec3=ever_ec0==1 & ever_ec3==1
replace retract_ec3=. if ever_ec3==.
gen retract_ec6=ever_ec0==1 & ever_ec6==1
replace retract_ec6=. if ever_ec6==.
gen retract_ec9=ever_ec0==1 & ever_ec9==1
replace retract_ec9=. if ever_ec9==.
gen retract_ec12=ever_ec0==1 & ever_ec12==1
replace retract_ec12=. if ever_ec12==.

tab ever_ec0
tab1 retract_ec* if ever_ec0==1

* Ever given birth
* Unclear what the skip pattern is.  
tab qq1_a, missing
tab qq1_c, missing
tab qq1_d, missing
tab qq1_e, missing
tab qq1_f, missing


drop ever_birth0
gen ever_birth0=qq1_a==2
*replace ever_birth0=. if qq1_a==. | qq1_a==3
tab ever_birth0 qq1_a
tab qq1_a everpreg0

gen ever_birth3=qq1_c==2
tab ever_birth3 qq1_c
replace ever_birth3=. if  qq1_c==3

** Ever emotionally abused
gen ever_emotabused0=bb1_a==2
tab ever_emotabused0 bb1_a

gen ever_emotabused3=bb1_c==2
replace ever_emotabused3=. if bb1_c==. | bb1_c==3

gen ever_emotabused6=bb1_d==2
replace ever_emotabused6=. if bb1_d==. | bb1_d==3

gen ever_emotabused9=bb1_e==2
replace ever_emotabused9=. if bb1_e==. | bb1_e==3

gen ever_emotabused12=bb1_f==2
replace ever_emotabused12=. if bb1_f==. | bb1_f==3

tab1 ever_emotabused*

** Ever physically abused
gen ever_physabused0=bb3_a==2
tab ever_physabused0 bb3_a

gen ever_physabused3=bb3_c==2
tab ever_physabused3 bb3_c
replace ever_physabused3=. if bb3_c==. | bb3_c==3

gen ever_physabused6=bb3_d==2
replace ever_physabused6=. if bb3_d==. | bb3_d==3

gen ever_physabused9=bb3_e==2
replace ever_physabused9=. if bb3_e==. | bb3_e==3

gen ever_physabused12=bb3_f==2
replace ever_physabused12=. if bb3_f==. | bb3_f==3

tab1 ever_physabused*


