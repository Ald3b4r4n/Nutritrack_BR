# Future Contracts: API Synchronization

**Note**: O MVP do NutriTrack BR é 100% offline-first e não se comunica com backends. Os contratos abaixo são um mero esboço conceitual para planejamento futuro, ditando como o frontend formatará os payloads caso uma API de nuvem venha a existir.

## 1. Importação de Base Nutricional (TBCA/USDA)

**Endpoint Futuro**: `GET /api/v1/nutrition/database`
**Uso**: Puxar atualizações diferenciais da base nutricional base para o SQLite local.

**Payload de Resposta (JSON)**:
```json
{
  "version": "1.0.2",
  "updatedItems": [
    {
      "id": "tbca-123",
      "name": "Arroz Branco Cozido",
      "source": "TBCA",
      "nutrients": {
        "calories": 130.0,
        "protein": 2.7,
        "carbohydrates": 28.1,
        "fat": 0.3
      }
    }
  ],
  "deletedItems": ["tbca-120"]
}
```

## 2. Sync de Diário (Backup na Nuvem)

**Endpoint Futuro**: `POST /api/v1/sync/meal-records`
**Uso**: Enviar dados do SQLite local (MealRecords e MealEntries) criados ou modificados desde a última sincronização.

**Payload de Envio (JSON)**:
```json
{
  "deviceId": "uuid",
  "records": [
    {
      "id": "uuid",
      "date": "2026-05-01T00:00:00Z",
      "entries": [
        {
          "id": "uuid",
          "mealType": "LUNCH",
          "foodItemId": "tbca-123",
          "quantity": 100,
          "servingWeightGrams": 100,
          "action": "UPSERT" // ou "DELETE"
        }
      ]
    }
  ]
}
```

## 3. Autenticação e Perfil

**Endpoint Futuro**: `POST /api/v1/auth/register`
**Uso**: Cadastro de usuário futuro para backup em nuvem. Não haverá coleta de dados não essenciais.
