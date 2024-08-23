set maxvar 30000
set matsize 11000
*use "/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181019.dta"

*use "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/nliten20200208.dta"


* use "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/nliten20200916dose.dta"


use "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/nliten20200924dose.dta"


*** Merge adherence data again.

rename ID id
rename idtext ID
sort ID
merge 1:1 ID using "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/calldata0925.dta"

tab Call1Date treat, missing

drop Call*Miss
drop Text*Miss

gen Call1Miss=Call1Date==.
gen Call2Miss=Call2Date==.
gen Call3Miss=Call3Date==.
gen Call4Miss=Call4Date==.
gen Call5Miss=Call5Date==.
gen Call6Miss=Call6Date==.
gen Call7Miss=Call7Date==.
gen Call8Miss=Call8Date==.


gen Call1Done=Call1Date!=.
gen Call2Done=Call2Date!=.
gen Call3Done=Call3Date!=.
gen Call4Done=Call4Date!=.
gen Call5Done=Call5Date!=.
gen Call6Done=Call6Date!=.
gen Call7Done=Call7Date!=.
gen Call8Done=Call8Date!=.

tab2 Call*Done treat, missing

foreach y in Call1Done Call2Done Call3Done Call4Done Call5Done Call6Done Call7Done Call8Done {
	tab `y' treat, missing col
}

foreach y in Text1Done Text2Done Text3Done Text4Done Text5Done Text6Done Text7Done Text8Done {
	tab `y' treat, missing col
}

list totalcalls Call1Date Call2Date Call3Date if treat==. & Call1Done==1


gen totalcalls=Call1Done+Call2Done+Call3Done+Call4Done+Call5Done + Call6Done + Call7Done + Call8Done
tab totalcalls treat, missing col
tab  treat totalcalls, missing row

gen Text1Done=Text1Date!=.
gen Text2Done=Text2Date!=.
gen Text3Done=Text3Date!=.
gen Text4Done=Text4Date!=.
gen Text5Done=Text5Date!=.
gen Text6Done=Text6Date!=.
gen Text7Done=Text7Date!=.
gen Text8Done=Text8Date!=.

gen totaltexts=Text1Done+ Text2Done + Text3Done+ Text4Done + Text5Done + Text6Done + Text7Done+ Text8Done
tab   treat totaltexts, missing row
tab    totaltexts treat, missing col


tab Call1Miss treat, missing col
tab Call2Miss treat, missing col
tab Call3Miss treat, missing col
tab Call4Miss treat, missing col
tab Call5Miss treat, missing col
tab Call6Miss treat, missing col
tab Call7Miss treat, missing col
tab Call8Miss treat, missing col



gen Text1Miss=Text1Date==.
gen Text2Miss=Text2Date==.
gen Text3Miss=Text3Date==.
gen Text4Miss=Text4Date==.
gen Text5Miss=Text5Date==.
gen Text6Miss=Text6Date==.
gen Text7Miss=Text7Date==.
gen Text8Miss=Text8Date==.

tab Text1Miss treat, missing col
tab Text2Miss treat, missing col
tab Text3Miss treat, missing col
tab Text4Miss treat, missing col
tab Text5Miss treat, missing col
tab Text6Miss treat, missing col
tab Text7Miss treat, missing col
tab Text8Miss treat, missing col

destring TotalCallTime1, generate (call1time)


tab  treat totalcalls, missing row

log using "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/phone call records", text replace
**** Non-participants who were called

tab totalcalls totaltexts if treat==. & totalcalls!=0


tab Cohort_a Cond_a if treat==. & totalcalls!=0, missing
list bldate if treat==. & totalcalls!=0

list Cond_a totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==. & totalcalls!=0

**** Control who were called

tab totalcalls totaltexts if treat==1 & totalcalls!=0

list Cond_a totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==1 & totalcalls!=0


*list totalcalls totaltexts Scripts* TotalCallTime* if treat==1 & totalcalls!=0

**** Horizons who were called 0 times

tab totalcalls totaltexts if treat==2 & totalcalls==0


list Cond_a totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==2 & totalcalls==0


**** Horizons+GMET who were called 0 times

tab totalcalls totaltexts if treat==3 & totalcalls==0

list Cond_a totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==3 & totalcalls==0

**** Horizons who were called 1 time

list totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==2 & totalcalls==1

**** Horizons who were called 2 time

list totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==2 & totalcalls==2

**** Horizons who were called 7 or 8 times

list totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==2 & totalcalls>=7


*list totalcalls totaltexts Scripts* TotalCallTime* if treat==2 & totalcalls!=4

**** Horizons+GMET who were called 1  time


list totalcalls totaltexts Call1Date Scripts1 Call2Date Scripts2 Call3Date Scripts3 Call4Date Scripts4 Call5Date Scripts5 Call6Date Scripts6 Call7Date Scripts7 Call8Date Scripts8 TotalCallTime* if treat==3 & totalcalls==1


*list totalcalls totaltexts Scripts* TotalCallTime* if treat==3 & totalcalls!=8

log close


****** Adherence
drop ws1miss ws2miss ws3miss

insheet using "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/doses-data-revised2.csv", comma
rename id ID
merge 1:1 ID using "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/Nliten/nliten20200208.dta"

tab treat makeupws

gen ws1miss=ws1date==""
gen ws2miss=ws2date==""
gen ws3miss=ws3date==""

gen ws3miss_3sess=ws3miss==1 & sessions==3

tab treat sessions, missing

tab ws2miss treat if sessions==2, missing
tab ws3miss treat if sessions==3, missing

tab ws2miss treat if sessions==3, missing

gen ws23miss=ws2miss==1 | ws3miss_3sess==1

tab ws2miss treat, missing

tab ws23miss treat if makeupws==., missing
tab ws23miss treat if makeupws==1, missing

prop.test(c(9, 17), c(190, 185))
prop.test(c(23, 5), c(190, 185))
prop.test(c(32, 22), c(190, 185))


tab makeupws treat if sessions==3 & ws3miss==1, missing

tab makeupws treat if sessions==2 & ws2miss==1, missing

list bldate ws1date if sessions==3

drop sessmiss
gen sessmiss=sessions==.
list Count ws1date ws2date ws3date treat if sessmiss==1

tab makeupws treat if sessions==2, missing

replace sessions=3 if Count==59 | Count==63
replace sessions=3 if Count==20
replace sessions=2 if Count==61
replace sessions=2 if Count==45 | Count==85

* 23 horizons and 5 horizons+gmet had make up sessions

** Phone calls seriously
gen call1miss=call1date==""
gen call2miss=call2date==""
gen call3miss=call3date==""
gen call4miss=call4date==""
gen call5miss=call5date==""
gen call6miss=call6date==""
gen call7miss=call7date==""
gen call8miss=call8date==""

gen text1miss=text1date==""
gen text2miss=text2date==""
gen text3miss=text3date==""
gen text4miss=text4date==""
gen text5miss=text5date==""
gen text6miss=text6date==""
gen text7miss=text7date==""
gen text8miss=text8date==""


tab call1miss treat, missing col chi2
tab call2miss treat, missing col chi2
tab call3miss treat, missing col chi2
tab call4miss treat, missing col chi2
tab call5miss treat, missing col chi2
tab call6miss treat, missing col chi2
tab call7miss treat, missing col chi2
tab call8miss treat, missing col chi2


tab text1miss treat, missing col chi2
tab text2miss treat, missing col chi2
tab text3miss treat, missing col chi2
tab text4miss treat, missing col chi2
tab text5miss treat, missing col chi2
tab text6miss treat, missing col chi2
tab text7miss treat, missing col chi2
tab text8miss treat, missing col chi2


*** Multiple imputation
** Impute wide data

mi unregister  condomuse3 condomuse6 condomuse9 condomuse12 sti3 sti6 sti9 sti12  sti_trich3 sti_trich6 sti_trich9 sti_trich12 safesex3 safesex6  safesex9 safesex12 audit3 audit6 audit9 audit12 auditzone3 auditzone6 auditzone9 auditzone12 nevercondom3 nevercondom6  nevercondom9 nevercondom12 alcoholrisk3 alcoholrisk6 alcoholrisk9 alcoholrisk12 alcoholfreq3 alcoholfreq6 alcoholfreq9 alcoholfreq12 Alc_Context3 Alc_Context6 Alc_Context9 Alc_Context12 chlamydia3 chlamydia6 chlamydia9 chlamydia12 gonorrhea3 gonorrhea6 gonorrhea9 gonorrhea12 trich3 trich6 trich9 trich12 drink_freq3 drink_freq6 drink_freq9 drink_freq12 marijuana_daily3 marijuana_daily6 marijuana_daily9 marijuana_daily12 marijuana_month3 marijuana_month6 marijuana_month9 marijuana_month12 marijuana_freq3 marijuana_freq6 marijuana_freq9 marijuana_freq12 drink_weekly3 drink_weekly6 drink_weekly9 drink_weekly12 drink_num3 drink_num6 drink_num9 drink_num12 drink_moderate3 drink_moderate6 drink_moderate9 drink_moderate12 drink_excess3 drink_excess6 drink_excess9 drink_excess12 binge_freq3 binge_freq6 binge_freq9 binge_freq12 binge_weekly3 binge_weekly6 binge_weekly9 binge_weekly12 exchangesex3 exchangesex6 exchangesex9 exchangesex12 emot_abuse_3m3 emot_abuse_3m6 emot_abuse_3m9 emot_abuse_3m12 recentpartners3 recentpartners6 recentpartners9 recentpartners12 preg3 preg6 preg9 preg12 

tab1 snap0 children0 condomuse0   audit0  nevercondom0 alcoholrisk0 alcoholfreq0 Alc_Context0 chlamydia0 gonorrhea0 trich0 marijuana_daily0 marijuana_month0 marijuana_freq0 drink_weekly0 drink_num0 drink_moderate0, missing

** Multiple imputation October 6, 2020

mi set wide
mi register imputed condomuse3 condomuse6 condomuse9 condomuse12 safesex3 safesex6  safesex9 safesex12 audit3 audit6 audit9 audit12 nevercondom3 nevercondom6  nevercondom9 nevercondom12 alcoholrisk3 alcoholrisk6 alcoholrisk9 alcoholrisk12 alcoholfreq3 alcoholfreq6 alcoholfreq9 alcoholfreq12 Alc_Context3 Alc_Context6 Alc_Context9 Alc_Context12 chlamydia3 chlamydia6 chlamydia9 chlamydia12 gonorrhea3 gonorrhea6 gonorrhea9 gonorrhea12 trich3 trich6 trich9 trich12 preg3 preg6 preg9 preg12 

# safesex0 is all 0 by inclusion criterion.

mi impute mvn condomuse3 condomuse6 condomuse9 condomuse12 safesex3 safesex6  safesex9 safesex12 audit3 audit6 audit9 audit12 nevercondom3 nevercondom6  nevercondom9 nevercondom12 alcoholrisk3 alcoholrisk6 alcoholrisk9 alcoholrisk12 alcoholfreq3 alcoholfreq6 alcoholfreq9 alcoholfreq12 Alc_Context3 Alc_Context6 Alc_Context9 Alc_Context12 chlamydia3 chlamydia6 chlamydia9 chlamydia12 gonorrhea3 gonorrhea6 gonorrhea9 gonorrhea12 trich3 trich6 trich9 trich12  preg3 preg6 preg9 preg12  = snap0 children0  audit0  nevercondom0 alcoholrisk0 alcoholfreq0 Alc_Context0 chlamydia0 gonorrhea0 trich0 marijuana_daily0 marijuana_month0 marijuana_freq0 drink_weekly0 drink_num0 drink_moderate0 , add(10)

mi describe
mi varying 

mi reshape long condomuse sti sti_trich mult_sti safesex audit auditzone  alcoholrisk alcoholfreq Alc_Context  drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq  exchangesex emot_abuse_3m recentpartners preg , i(ID) j(months 3 6 9 12)


* Try GLM with number times condoms and number times sex instead of percent condom use.
* sti_trich mult_sti Alc_Context marijuana_daily


mi xtset ID months, monthly

mi estimate: sum safesex

* This works with gaussian link.
mi estimate: xtgee safesex i.treat months
mi estimate, eform: xtgee safesex i.treat months, family(poisson)
mi estimate, eform: xtgee safesex i.treat months, family(poisson) robust
mi estimate, eform: xtgee safesex i.treat months, family(nbinomial) robust



mi estimate, eform: xtgee safesex i.treat months, family(binomial) link(logit)
mi estimate, eform: xtgee nevercondom i.treat months, family(binomial) link(logit)


foreach y in safesex nevercondom condomuse chlamydia gonorrhea trich alcoholrisk binge_weekly audit Alc_Context {

	mi estimate, eform: xtgee `y' i.treat months, family(nbinomial) robust

}



foreach y in safesex nevercondom condomuse chlamydia gonorrhea trich alcoholrisk binge_weekly audit Alc_Context {

	mi estimate, eform: xtgee `y' i.treat months treat#months, family(nbinomial) robust

}








*** Impute missing data: long
reshape long condomuse sti sti_trich mult_sti safesex audit auditzone nevercondom alcoholrisk alcoholfreq Alc_Context chlamydia gonorrhea trich drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq binge_weekly exchangesex emot_abuse_3m recentpartners preg , i(ID) j(months 3 6 9 12)

mi unregister  condomuse sti sti_trich mult_sti safesex audit auditzone nevercondom alcoholrisk alcoholfreq Alc_Context chlamydia gonorrhea trich drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq binge_weekly exchangesex emot_abuse_3m recentpartners preg 


mi set mlong
mi register imputed condomuse sti sti_trich mult_sti safesex audit auditzone nevercondom alcoholrisk alcoholfreq Alc_Context chlamydia gonorrhea trich drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq binge_weekly exchangesex emot_abuse_3m recentpartners preg 

mi impute mvn condomuse sti sti_trich mult_sti safesex audit auditzone nevercondom alcoholrisk alcoholfreq Alc_Context chlamydia gonorrhea trich drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq binge_weekly exchangesex emot_abuse_3m recentpartners preg  = snap0 children0 condomuse0 sti0 sti_trich0 safesex0 audit0 auditzone0 nevercondom0 alcoholrisk0 alcoholfreq0 Alc_Context0 chlamydia0 gonorrhea0 trich0 drink_freq0 marijuana_daily0 marijuana_month0 marijuana_freq0 drink_weekly0 drink_num0 drink_moderate0 drink_excess0 binge_freq0 binge_weekly0 exchangesex0 emot_abuse_3m0 recentpartners0 , add(10)

mi describe
mi varying 



** We can (1) create a composite STI score (any STI+; CT, GC, Trich) at each time point and look at the proportion of participants in each arm relative to the Control and then the two interventions relative to each other.  We can also (2) do a count of STIs, summing the number of new STIs over the FU period and examining mean differences.
For multiple infections, (3) we can examine the proportion in each condition who had two new infections at different FU assessments.  (1) had multiple STIs, and (0) did not have multiple STIs

* Primary outcomes
* Safe sex:  binary safesex0, ... safesex12
* % Condom use in past 90 days but redefine so abstinence = 100% instead of missing
* STI:  gonorrhea or chlamydia, chlamydia0, chlamydia3, .., chlamydia12
* gonorrhea0, gonorrhea3 ,...; sti0, ..., sti12
* SEcondary outcomes:  AUDIT:  audit0, audit3, ...


foreach y in chlamydia3 chlamydia6 chlamydia9 chlamydia12 {
	logistic `y' i.treat 
*	poisson `y' i.treat, irr robust
}

foreach y in gonorrhea3 gonorrhea6 gonorrhea9 gonorrhea12 {
*	poisson `y' i.treat, irr robust
	logistic `y' i.treat 
}

mean chlamydia6, over(treat)

bysort treat: mean chlamydia6

foreach y in sti3 sti6 sti9 sti12 {
	poisson `y' i.treat, irr robust
}

foreach y in audit3 audit6 audit9 audit12 {
	poisson `y' i.treat, irr robust
}

foreach y in alcoholfreq3 alcoholfreq6 alcoholfreq9 alcoholfreq12 {
	poisson `y' i.treat, robust irr
}

foreach y in condomuse3 condomuse6 condomuse9 condomuse12 {
	poisson `y' i.treat, robust irr
}

foreach y in nevercondom3 nevercondom6 nevercondom9 nevercondom12 {
	poisson `y' i.treat, irr robust
}

foreach y in safesex3 safesex6 safesex9 safesex12 {
	poisson `y' i.treat, robust irr
}

* check:  Alc_Context and subscales
* Alc_Expect,   Alc_Control, MJ_Control, Alc_Intent, Alc_RefSE, PNorm_Sub Use, 
*PNorm_Sex STDKnow Sex_RefSE
* Power 

*reshape wide condomuse sti safesex audit auditzone nevercondom alcoholrisk alcoholfreq Alc_Context chlamydia gonorrhea trich drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq binge_weekly exchangesex emot_abuse_3m recentpartners preg , i(ID) j(months)
tab trich0

foreach y in trich3 trich6 trich9 trich12 {
*	logistic `y' i.treat 
	poisson `y' i.treat, irr robust
}

poisson sti_count i.treat, irr robust


*reshape wide condomuse sti safesex audit nevercondom alcoholrisk alcoholfreq chlamydia gonorrhea , i(ID) j(months)


reshape long condomuse sti sti_trich mult_sti safesex audit auditzone nevercondom alcoholrisk alcoholfreq Alc_Context chlamydia gonorrhea trich drink_freq marijuana_daily marijuana_month marijuana_freq drink_weekly drink_num drink_moderate drink_excess binge_freq binge_weekly exchangesex emot_abuse_3m recentpartners preg , i(ID) j(months 3 6 9 12)
xtset ID months, monthly
*xtgee condomuse i.treat months, family(binomial) 
*xtgee audit i.treat months, family(gamma)
*xtgee alcoholfreq i.treat months, family(poisson)

*** New analysis Dec 26
xtreg sti_trich i.treat months
xtgee sti_trich i.treat months, family(binomial) eform

xtreg mult_sti i.treat months
xtgee mult_sti i.treat months, family(binomial) eform


**** New analysis Nov 18, 2019
* Alcohol context: significant for both
*bysort treat:xttab Alc_Context 
xtreg Alc_Context i.treat 
xtgee Alc_Context i.treat months, family(poisson) eform

*    marijuana_freq  drink_num drink_moderate   emot_abuse_3m

* Not significant
*bysort treat:xttab Alc_Context 
xtreg auditzone i.treat months
xtgee auditzone i.treat months, family(poisson) eform

* Not significant 
bysort treat:xttab marijuana_daily 
xtreg marijuana_daily i.treat months
xtgee marijuana_daily i.treat months, family(binomial) eform

* Not significant 
bysort treat:xttab marijuana_month 
xtreg marijuana_month i.treat months
xtgee marijuana_month i.treat months, family(binomial) eform

* Significant for only Horizons+GMET.
bysort treat:xttab drink_weekly 
xtreg drink_weekly i.treat months
xtgee drink_weekly i.treat months, family(binomial) eform

* Not significant
bysort treat:xttab drink_freq 
xtreg drink_freq i.treat months
xtgee drink_freq i.treat months, family(poisson) eform


* Significant for both.
bysort treat:xttab binge_weekly 
xtreg binge_weekly i.treat 
xtgee binge_weekly i.treat months, family(binomial) eform

* Significant for only Horizons.
bysort treat:xttab drink_excess 
xtreg drink_excess i.treat months
xtgee drink_excess i.treat months, family(binomial) eform


* Significant for Horizons but not HOrizons+GMET.  Not sure this is the right model anyhow.
bysort treat:xttab binge_freq
xtreg binge_freq i.treat 
xtgee binge_freq i.treat months, family(poisson) eform


* Significant for Horizons + GMET??
*bysort treat:xttab Alc_Context 
xtreg recentpartners i.treat months
xtgee recentpartners i.treat months, family(poisson) eform



* Not signficant
bysort treat:xttab trich 
xtreg trich i.treat months
xtgee trich i.treat months, family(binomial) eform


* Not signifciant
bysort treat:xttab exchangesex 
xtreg exchangesex i.treat months
xtgee exchangesex i.treat months, family(binomial) eform


* Not significant
bysort treat:xttab preg 
xtreg preg i.treat 
xtgee preg i.treat months, family(binomial) eform


** Compare the two treatments for each outcome
** 
*0% condom use in past 90 days 
*Risky alcohol use 
*Drinking context scale Alc_Context


xtgee safesex anytreat extratreat, family(binomial) eform
xtgee chlamydia anytreat extratreat, family(binomial) eform
xtgee gonorrhea anytreat extratreat, family(binomial) eform
xtgee sti anytreat extratreat, family(binomial) eform
xtgee binge_weekly anytreat extratreat, family(binomial) eform
xtgee alcoholrisk anytreat extratreat, family(binomial) eform
xtgee nevercondom anytreat extratreat, family(binomial) eform

xtgee condomuse anytreat extratreat, family(poisson) eform
xtgee audit anytreat extratreat, family(poisson) eform
xtgee Alc_Context anytreat extratreat, family(poisson) eform



*** Older analysis

* STI
*bysort treat:xttab sti 
*xtgee sti i.treat months, family(binomial)

bysort treat:xttab chlamydia 
xtreg chlamydia i.treat
xtgee chlamydia i.treat months, family(binomial) eform

bysort treat:xttab gonorrhea 
xtgee gonorrhea i.treat months, family(binomial) eform


* Safe sex
xttab safesex
*xtreg safesex anytreat
xtreg safesex i.treat
bysort treat: xttab safesex 
*bysort anytreat: xttab safesex 
xtgee safesex i.treat months, family(binomial) eform
*xtgee safesex i.treat months, family(poisson) eform
* xtgee safesex i.treat months months#i.treat, family(binomial) eform


*xtgee nevercondom i.treat months, family(poisson) eform

*xtgee nevercondom i.treat months, family(binomial) eform
xtgee nevercondom i.treat , family(binomial) eform


* Condom use
xtreg condomuse i.treat 
*xtgee condomuse i.treat months, family(binomial) eform
xtgee condomuse i.treat months, family(poisson) eform


* AUDIT and alcoholrisk
histogram audit

xtreg audit i.treat 
xtgee audit i.treat months, family(poisson) eform

bysort treat:xttab alcoholrisk
xtreg alcoholrisk i.treat 
xtgee alcoholrisk i.treat months, family(binomial) eform


reshape wide condomuse sti safesex audit nevercondom alcoholrisk alcoholfreq chlamydia gonorrhea , i(ID) j(months)

* Predicting chlamydia and gonorrhea. 
* Significant for gonorrhea but not chlamydia or both
*poisson anysti i.treat anysti0, irr robust
*poisson anyct i.treat chlamydia0, irr robust
*poisson anyng i.treat gonorrhea0, irr robust

* Significant for gonorrhea but not chlamydia or both
*poisson anysti i.treat , irr robust
poisson anyct i.treat , irr robust
poisson anyng i.treat , irr robust

** Used this one:  

*gen horizons=treat=="Horizons"
*gen horizons_gmet=treat=="Horizons + GMET"

* How are sample sizes determined for condom use?
* n=428 out of 482
* Why is condom  use missing?
tab  condomuse3 safesex3

* n=548 out of 560
tab  condomuse0 safesex0 
* n=421
semipar condomuse3 horizons horizons_gmet , nonpar(condomuse0)

foreach y in condomuse3 condomuse6 condomuse9 condomuse12 {
	semipar `y' horizons horizons_gmet , nonpar(condomuse0)
}

foreach y in Alc_Context3 Alc_Context6 Alc_Context9 Alc_Context12 {
	semipar `y' horizons horizons_gmet , nonpar(Alc_Context0)
}

* Not so impressive
foreach y in audit3 audit6 audit9 audit12 {
	semipar `y' horizons horizons_gmet , nonpar(audit0)
}