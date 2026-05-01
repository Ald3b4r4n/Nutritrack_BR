# Data Model: NutriTrack BR MVP

## Enums
- **FoodSource**: `TBCA`, `USDA`, `PROPRIETARY`, `CUSTOM`
- **MealType**: `BREAKFAST`, `LUNCH`, `DINNER`, `SNACKS`

## Entidades Principais

### UserProfile
- id: String (UUID)
- name: String
- calorieGoal: Integer (kcal)
- waterGoalMl: Integer (ml)
- weightGoalKg: Double (kg)

### NutrientProfile (Value Object ou Colunas embutidas)
- calories: Double
- protein: Double
- carbohydrates: Double
- fat: Double
- fiber: Double
- sodium: Double (nullable)

### ServingSize
- id: String (UUID)
- foodItemId: String (FK)
- description: String (e.g. "1 colher de sopa", "1 xícara")
- weightInGrams: Double
- defaultAmount: Double (e.g. 1.0)

### FoodItem
- id: String (UUID/External ID)
- name: String
- source: FoodSource
- nutrients: NutrientProfile (per 100g/100ml)
- isDeleted: Boolean (soft delete local)
- version: Integer (para metadados da fonte)

### BarcodeEntity
- barcode: String (PK, EAN/UPC)
- foodItemId: String (FK -> FoodItem)
- scannedAt: DateTime

### MealRecord (Diário de um Dia)
- id: String (UUID)
- date: DateTime (truncado para o dia)

### MealEntry (Item consumido na refeição)
- id: String (UUID)
- mealRecordId: String (FK -> MealRecord)
- mealType: MealType
- foodItemId: String (FK -> FoodItem)
- quantity: Double
- servingDescription: String (Snapshot do nome da porção)
- servingWeightGrams: Double (Snapshot do peso da porção)
- createdAt: DateTime

### WaterLog
- id: String (UUID)
- amountMl: Integer
- date: DateTime (truncado para o dia)
- createdAt: DateTime

### WeightLog
- id: String (UUID)
- weightKg: Double
- date: DateTime (truncado para o dia)
- notes: String (nullable)

### MealPlan (Modelo do Plano)
- id: String (UUID)
- name: String (Ex: "Dieta Semanal Básica")
- isActive: Boolean

### MealPlanDay (Atribuição do plano)
- id: String (UUID)
- mealPlanId: String (FK -> MealPlan)
- dayOfWeek: Integer (1=Seg, 7=Dom) ou date: DateTime

### MealPlanEntry (Metas macros de uma refeição no plano)
- id: String (UUID)
- mealPlanDayId: String (FK -> MealPlanDay)
- mealType: MealType
- targetCalories: Double
- targetProtein: Double
- targetCarbs: Double
- targetFat: Double

### RecentFoodByMeal (View materializada ou Tabela de uso)
- foodItemId: String (FK -> FoodItem)
- mealType: MealType
- lastUsedAt: DateTime
- useCount: Integer

### AssetMetadata
- id: String (UUID)
- assetPath: String
- promptUsed: String (para registro do Gemini Image/Nano Banana)
- createdAt: DateTime

### SyncMetadata (Planejado para futuro Backend)
- entityId: String
- entityName: String
- lastModifiedLocal: DateTime
- syncedAt: DateTime (nullable)
- isDirty: Boolean
