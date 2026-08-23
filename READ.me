# Where Mortgage Applications Fail in New York

**A denial reason analysis of 2025 HMDA lending data**

SQL Tableau 116,940 applications

**[View the dashboard](https://public.tableau.com/views/WhereMortgageApplicationsFailinNewYork/Dashboard1)**

![Dashboard showing denial rates and denial reasons across New York counties](images/dashboard.png)

---

## Executive Summary

In most of New York's counties, mortgage applications are denied because of the 
borrower's finances. In the Bronx that is not the case.

The Bronx has the highest mortgage denial rate of any county at 21.3%. 
Income does not explain it. The gap against Suffolk County is there at every
income level. Credit history does not explain it either since it accounts for
about 9% of denials in both places.

The difference is the property. 8.7% of bronx applications are denied over
collateral which means the appraisal came in below the agreed price.
In Suffolk it is 1.3%.

---

## Business Problem

Processing a mortgage application costs a lender money: credit pulls, 
underwriting time and the appraisal. When an application is denied over the
appraisal, most of that money has already been spent.

Lenders track their overall denial rate but that number does not show where
in the process applications are failing. A market where applications fail 
on affordability needs different handling from one where they fail on 
valuation.

This analysis looks at where applications fail across New York and what causes
it. 

---

# Data

2025 HMDA Loan/Application Register, published by the CFPB in April 2026. 
Pulled from the Data Browser API, filtered to New York state and action codes
1, 2 and 3.

| | Records |
|---|---|
| Decisioned applications, New York State | 320,184 |
| After filtering | 116,940 |

The public file leaves out some information for privacy. There are no credit
scores. Loan amounts and property values are rounded to $10,000 midpoints.
Debt-to-income is reported in bands rather than exact numbers. A lender working
with its own data would see more.

---

## How I Approached It

**Defining the denial rate.** HMDA records eight outcome codes. Three of them 
are applications that received a decision: approved, approved but not accepted
and denied. The others are withdrawn, incomplete or loans purchased from
another institution, which were never applications here. I pulled codes 1, 2, 
3 only so the denial rate is denials divided by applications that got a
decision.

**Choosing the population.** Raw HMDA combines home purchases with home
improvement loans, refinances, investment properties and second liens. These
are underwritten differently and denied at different rates. Filtering to home
purchase, first lien, primary residence brings the statewide rate from 24%
down to 12%. Without that filter, differences in product mix would show up as
differences between counties.

**Testing income.** I split both counties into five income bands and compared
them band by band. If income were the reason, the gap should close when
comparing people who earn the same amount. It does not.

**Testing housing type.** The Bronx has more two to four unit buildings than
Suffolk and those are appraised differently. I compared single family homes
only. The gap got wider.

**Choosing Suffolk as the comparison.** It has the most applications of any
county in the filtered data at 11,865 and it is the closest large suburban
market to the city. I avoided comparing the highest county to the lowest,
since that would exaggerate any gap.

---

## What I Found

### Where are the Applications Failing?

The Bronx, more than anywhere else in New York State.

| County | Denial Rate | Applications |
|---|---|---|
| Bronx | 21.3% | 2,271 |
| Queens | 15.4% | 9,112 |
| Brooklyn | 14.4% | 6,938 |
| Manhattan | 12.5% | 5,211 |
| Rockland | 10.4% | 2,254 |
| Staten Island | 9.9% | 3,108 |
| Westchester | 9.3% | 7,034 |
| Nassau | 9.0% | 9,250 |
| Onondaga | 8.7% | 4,002 |
| Suffolk | 8.4% | 11,865 |
| Erie | 8.1% | 7,968 |
| Albany | 7.7% | 2,509 |
| Monroe | 5.8% | 6,571 |

That is two and a half times Suffolk County and higher than any county upstate.

### Is it because the Bronx is poorer?

That was the first thing I checked, it is not.

![Denial rate by income band, Bronx is above Suffolk in every band](images/income_bands.png)

| Household Income | Bronx | Suffolk | Ratio |
|---|---|---|---|
| under $50k | 56.3% | 49.0% | 1.1x|
| $50-$100k | 30.1% | 17.9% | 1.77x |
| $100-$150k | 21.1% | 8.1% | 2.6x |
| $150-$250k | 14.3% | 6.0% | 2.4x |
| $250k+ | 12.4% | 5.8% | 2.1x|

The gap appears in every band and is widest in the middle. A Bronx household
earning $100-$150k is denied more often than a Suffolk household earning half
that. Above $250k it is still 12.4% against 5.8% and those are buyers who can
clearly afford the loan.

The under $50k row is based on only 64 Bronx applications, so I would not rely 
on it. 

### Is it credit?

No. Credit history accounts for 9.1% of Bronx denials and 9.0% of Suffolk's.

### So what is it?

The property.

![Collateral denial rate by county, Bronx highest at 8.7%](images/collateral_by_county.png)

| Denial Reason | Bronx | Suffolk |
|---|---|---|
| Collateral | 40.9% | 15.6% |
| Debt-to-Income | 23.1% | 45.0% |
| Credit History | 9.1% | 9.0% |

The two biggest reasons swap places. In Suffolk, most denials come down to 
affordability. In the Bronx, most come down to the appraisal.

As a share of all applications rather than of denials, 8.7% of Bronx applications arew denied over collateral, against 1.3% in Suffolk.
Comparing single family homes only, which rules out the Bronx's multi unit
housing stock, the gao widens to 11.2% against 1.3%.

This is not limited to the Bronx. Manhattan at 7.0%, Queens at 5.7% and
Brooklyn 5.1% are all above every suburban cointy. The Bronx is the most
extreme case.

__

## Things I Got Wrong or Did Not Expect




