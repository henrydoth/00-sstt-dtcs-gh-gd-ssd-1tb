import numpy as np
from scipy.stats import wilcoxon

# Example data: Pre-treatment vs Post-treatment scores
pre_treatment = np.array([85, 89, 76, 91, 82, 77, 84, 90, 78, 88])
post_treatment = np.array([87, 85, 79, 93, 83, 78, 86, 92, 80, 89])

# Perform Wilcoxon signed-rank test
stat, p_value = wilcoxon(pre_treatment, post_treatment)

print(f"Wilcoxon Test Statistic: {stat}")
print(f"P-value: {p_value}")

# Interpretation
alpha = 0.05  # Significance level
if p_value < alpha:
    print("Reject the null hypothesis: There is a significant difference.")
else:
    print("Fail to reject the null hypothesis: No significant difference found.")
