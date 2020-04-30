
# 25(OH)D in nmol/L=value in ng/mL* 2.496
# 10 ng/ml = 10ng/ml*24.96 nmol/L 

# TOTAL MORTALITY 
# Per 10 ng/ml (24.96) is HR 0.85 (0.68-1.09)

(log(0.85)/24.96)*10
# -0.06511175 per 10 nmol/L 

# exponentiate 
exp(-0.06511175)
# 0.9369628 so HR=0.93 per 10nmol/L 

#-----------------------------
# Lower bound per 10ng/ml is 0.68 
(log(0.68)/24.96)*10
# -0.1545122 per 10 nmol/L 

# exponentiate 
exp(-0.1545122)
# 0.856833 so Lower 95% CI=0.85 

#----------------------------
# Upper bound per 10ng/ml is 1.09
(log(1.09)/24.96)*10
#  0.03452632 per 10 nmol/L 

# exponentiate 
exp(0.03452632)
# 1.035129 so upper 95% CI=1.03


# New estimate per 10 nmol/L is: 0.93 (0.85-1.03)

#--------------------------------------------
# BREAST CANCER SPECIFIC MORTALITY 
# Per 10 ng/ml (24.96) is HR 1.08	(0.75-1.54)

(log(1.08)/24.96)*10
# -0.06511175 per 10 nmol/L 

# exponentiate 
exp(0.03083375)
# 1.031314 so HR=1.03 per 10nmol/L 


#-----------------------------
# Lower bound per 10ng/ml is 0.75
(log(0.75)/24.96)*10
# -0.1152572 per 10 nmol/L 

# exponentiate 
exp(-0.1152572)
# 0.8911369 so Lower 95% CI=0.89 

#----------------------------
# Upper bound per 10ng/ml is 1.54
(log(1.54)/24.96)*10
#  0.1729898 per 10 nmol/L 

# exponentiate 
exp(0.1729898)
# 1.188854 so upper 95% CI=1.19

# New estimate per 10 nmol/L is: 1.03 (0.89-1.19)








