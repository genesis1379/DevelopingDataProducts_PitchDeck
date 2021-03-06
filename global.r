# Nutrient variables for use throughout app
axis_vars <- c(
  "Water (g/100 g)" = "Water",
  "Food energy (kcal/100 g)" = "Energy",
  "Protein (g/100 g)" = "Protein",
  "Total lipid (fat)(g/100 g)" = "Lipid_Tot",
  "Ash (g/100 g)" = "Ash",
  "Carbohydrate, by difference (g/100 g)" = "Carbohydrt",
  "Total dietary fiber (g/100 g)" = "Fiber_TD",
  "Total sugars (g/100 g)" = "Sugar_Tot",
  "Calcium (mg/100 g)" = "Calcium",
  "Iron (mg/100 g)" = "Iron",
  "Magnesium (mg/100 g)" = "Magnesium",
  "Phosphorus (mg/100 g)" = "Phosphorus",
  "Potassium (mg/100 g)" = "Potassium",
  "Sodium (mg/100 g)" = "Sodium",
  "Zinc (mg/100 g)" = "Zinc",
  "Copper (mg/100 g)" = "Copper",
  "Manganese (mg/100 g)" = "Manganese",
  "Selenium (μg/100 g)" = "Selenium",
  "Vitamin C (mg/100 g)" = "Vit_C",
  "Thiamin (mg/100 g)" = "Thiamin",
  "Riboflavin (mg/100 g)" = "Riboflavin",
  "Niacin (mg/100 g)" = "Niacin",
  "Pantothenic acid  (mg/100 g)" = "Panto_Acid",
  "Vitamin B 6  (mg/100 g)" = "Vit_B6",
  "Folate, total (μg/100 g)" = "Folate_Tot",
  "Folic acid (μg/100 g)" = "Folic_Acid",
  "Food folate (μg/100 g)" = "Food_Folate",
  "Folate (μg dietary folate equivalents/100 g)" = "Folate_DFE",
  "Choline, total (mg/100 g)" = "Choline_Tot",
  "Vitamin B 12  (μg/100 g)" = "Vit_B12",
  "Vitamin A (IU/100 g)" = "Vit_A_IU",
  "Vitamin A (μg retinol activity equivalents/100g)" = "Vit_A_RAE",
  "Retinol (μg/100 g)" = "Retinol",
  "Alpha-carotene (μg/100 g)" = "Alpha_Carot",
  "Beta-carotene (μg/100 g)" = "Beta_Carot",
  "Beta-cryptoxanthin (μg/100 g)" = "Beta_Crypt",
  "Lycopene (μg/100 g)" = "Lycopene",
  "Lutein+zeazanthin (μg/100 g)" = "LutZea",
  "Vitamin E (alpha-tocopherol) (mg/100 g)" = "Vit_E",
  "Vitamin D (μg/100 g)" = "Vit_D_micro",
  "Vitamin D (IU/100 g)" = "Vit_D_IU",
  "Vitamin K (phylloquinone) (μg/100 g)" = "Vit_K",
  "Saturated fatty acid (g/100 g)" = "FA_Sat",
  "Monounsaturated fatty acids (g/100 g)" = "FA_Mono",
  "Polyunsaturated fatty acids (g/100 g)" = "FA_Poly",
  "Cholesterol (mg/100 g)" = "Cholestrl"
)

# Food Group Names
foodgroup_names <- c("American Indian/Alaska Native Foods",
  "Baby Foods",
  "Baked Products",
  "Beef Products",
  "Beverages",
  "Breakfast Cereals",
  "Cereal Grains and Pasta",
  "Dairy and Egg Products",
  "Fast Foods",
  "Fats and Oils",
  "Finfish and Shellfish Products",
  "Fruits and Fruit Juices",
  "Lamb, Veal, and Game Products",
  "Legumes and Legume Products",
  "Meals, Entrees, and Side Dishes",
  "Nut and Seed Products",
  "Pork Products",
  "Poultry Products",
  "Restaurant Foods",
  "Sausages and Luncheon Meats",
  "Snacks",
  "Soups, Sauces, and Gravies",
  "Spices and Herbs",
  "Sweets",
  "Vegetables and Vegetable Products"
)

food_tooltip <- function(x) {
  if (is.null(x)) return(NULL)
  if (is.null(x$FoodName)) return(NULL)
  # Pick out the food with the same name
  all_food <- isolate(df)
  foods <- all_food[all_food$FoodName == x$FoodName, ]
  # Pull proper names of axis variables
  xvar_name <- names(axis_vars)[axis_vars == "Energy"]
  yvar_name <- names(axis_vars)[axis_vars == "Protein"]
  # Put it all together, and whaddaya got?
  paste0("<b>Food: </b>", foods$FoodName, "<br>",
         "<b>Food group:</b> ", foods$FoodGroup, "<br>",
         "<b>",xvar_name, ": </b>", format(foods$Energy, big.mark = ",", scientific = FALSE), "<br>",
         "<b>",yvar_name, ": </b>", format(foods$Protein, big.mark = ",", scientific = FALSE)
  )
}