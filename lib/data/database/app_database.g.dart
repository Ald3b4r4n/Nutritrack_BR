// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FoodItemsTable extends FoodItems
    with TableInfo<$FoodItemsTable, FoodItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbohydratesMeta = const VerificationMeta(
    'carbohydrates',
  );
  @override
  late final GeneratedColumn<double> carbohydrates = GeneratedColumn<double>(
    'carbohydrates',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
    'fiber',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sodiumMeta = const VerificationMeta('sodium');
  @override
  late final GeneratedColumn<double> sodium = GeneratedColumn<double>(
    'sodium',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    source,
    calories,
    protein,
    carbohydrates,
    fat,
    fiber,
    sodium,
    isDeleted,
    version,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
        _carbohydratesMeta,
        carbohydrates.isAcceptableOrUnknown(
          data['carbohydrates']!,
          _carbohydratesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_carbohydratesMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('fiber')) {
      context.handle(
        _fiberMeta,
        fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta),
      );
    } else if (isInserting) {
      context.missing(_fiberMeta);
    }
    if (data.containsKey('sodium')) {
      context.handle(
        _sodiumMeta,
        sodium.isAcceptableOrUnknown(data['sodium']!, _sodiumMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      )!,
      carbohydrates: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbohydrates'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      )!,
      fiber: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber'],
      )!,
      sodium: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sodium'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
    );
  }

  @override
  $FoodItemsTable createAlias(String alias) {
    return $FoodItemsTable(attachedDatabase, alias);
  }
}

class FoodItem extends DataClass implements Insertable<FoodItem> {
  final String id;
  final String name;
  final String source;
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final double fiber;
  final double? sodium;
  final bool isDeleted;
  final int version;
  const FoodItem({
    required this.id,
    required this.name,
    required this.source,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    this.sodium,
    required this.isDeleted,
    required this.version,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source'] = Variable<String>(source);
    map['calories'] = Variable<double>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbohydrates'] = Variable<double>(carbohydrates);
    map['fat'] = Variable<double>(fat);
    map['fiber'] = Variable<double>(fiber);
    if (!nullToAbsent || sodium != null) {
      map['sodium'] = Variable<double>(sodium);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['version'] = Variable<int>(version);
    return map;
  }

  FoodItemsCompanion toCompanion(bool nullToAbsent) {
    return FoodItemsCompanion(
      id: Value(id),
      name: Value(name),
      source: Value(source),
      calories: Value(calories),
      protein: Value(protein),
      carbohydrates: Value(carbohydrates),
      fat: Value(fat),
      fiber: Value(fiber),
      sodium: sodium == null && nullToAbsent
          ? const Value.absent()
          : Value(sodium),
      isDeleted: Value(isDeleted),
      version: Value(version),
    );
  }

  factory FoodItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodItem(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      source: serializer.fromJson<String>(json['source']),
      calories: serializer.fromJson<double>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbohydrates: serializer.fromJson<double>(json['carbohydrates']),
      fat: serializer.fromJson<double>(json['fat']),
      fiber: serializer.fromJson<double>(json['fiber']),
      sodium: serializer.fromJson<double?>(json['sodium']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'source': serializer.toJson<String>(source),
      'calories': serializer.toJson<double>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbohydrates': serializer.toJson<double>(carbohydrates),
      'fat': serializer.toJson<double>(fat),
      'fiber': serializer.toJson<double>(fiber),
      'sodium': serializer.toJson<double?>(sodium),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'version': serializer.toJson<int>(version),
    };
  }

  FoodItem copyWith({
    String? id,
    String? name,
    String? source,
    double? calories,
    double? protein,
    double? carbohydrates,
    double? fat,
    double? fiber,
    Value<double?> sodium = const Value.absent(),
    bool? isDeleted,
    int? version,
  }) => FoodItem(
    id: id ?? this.id,
    name: name ?? this.name,
    source: source ?? this.source,
    calories: calories ?? this.calories,
    protein: protein ?? this.protein,
    carbohydrates: carbohydrates ?? this.carbohydrates,
    fat: fat ?? this.fat,
    fiber: fiber ?? this.fiber,
    sodium: sodium.present ? sodium.value : this.sodium,
    isDeleted: isDeleted ?? this.isDeleted,
    version: version ?? this.version,
  );
  FoodItem copyWithCompanion(FoodItemsCompanion data) {
    return FoodItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      source: data.source.present ? data.source.value : this.source,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbohydrates: data.carbohydrates.present
          ? data.carbohydrates.value
          : this.carbohydrates,
      fat: data.fat.present ? data.fat.value : this.fat,
      fiber: data.fiber.present ? data.fiber.value : this.fiber,
      sodium: data.sodium.present ? data.sodium.value : this.sodium,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sodium: $sodium, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    source,
    calories,
    protein,
    carbohydrates,
    fat,
    fiber,
    sodium,
    isDeleted,
    version,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.source == this.source &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbohydrates == this.carbohydrates &&
          other.fat == this.fat &&
          other.fiber == this.fiber &&
          other.sodium == this.sodium &&
          other.isDeleted == this.isDeleted &&
          other.version == this.version);
}

class FoodItemsCompanion extends UpdateCompanion<FoodItem> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> source;
  final Value<double> calories;
  final Value<double> protein;
  final Value<double> carbohydrates;
  final Value<double> fat;
  final Value<double> fiber;
  final Value<double?> sodium;
  final Value<bool> isDeleted;
  final Value<int> version;
  final Value<int> rowid;
  const FoodItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.source = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.fat = const Value.absent(),
    this.fiber = const Value.absent(),
    this.sodium = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoodItemsCompanion.insert({
    required String id,
    required String name,
    required String source,
    required double calories,
    required double protein,
    required double carbohydrates,
    required double fat,
    required double fiber,
    this.sodium = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       source = Value(source),
       calories = Value(calories),
       protein = Value(protein),
       carbohydrates = Value(carbohydrates),
       fat = Value(fat),
       fiber = Value(fiber);
  static Insertable<FoodItem> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? source,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? carbohydrates,
    Expression<double>? fat,
    Expression<double>? fiber,
    Expression<double>? sodium,
    Expression<bool>? isDeleted,
    Expression<int>? version,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (fat != null) 'fat': fat,
      if (fiber != null) 'fiber': fiber,
      if (sodium != null) 'sodium': sodium,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (version != null) 'version': version,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoodItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? source,
    Value<double>? calories,
    Value<double>? protein,
    Value<double>? carbohydrates,
    Value<double>? fat,
    Value<double>? fiber,
    Value<double?>? sodium,
    Value<bool>? isDeleted,
    Value<int>? version,
    Value<int>? rowid,
  }) {
    return FoodItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      source: source ?? this.source,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      sodium: sodium ?? this.sodium,
      isDeleted: isDeleted ?? this.isDeleted,
      version: version ?? this.version,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<double>(carbohydrates.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (sodium.present) {
      map['sodium'] = Variable<double>(sodium.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sodium: $sodium, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('version: $version, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServingSizesTable extends ServingSizes
    with TableInfo<$ServingSizesTable, ServingSize> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServingSizesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foodItemIdMeta = const VerificationMeta(
    'foodItemId',
  );
  @override
  late final GeneratedColumn<String> foodItemId = GeneratedColumn<String>(
    'food_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES food_items (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightInGramsMeta = const VerificationMeta(
    'weightInGrams',
  );
  @override
  late final GeneratedColumn<double> weightInGrams = GeneratedColumn<double>(
    'weight_in_grams',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultAmountMeta = const VerificationMeta(
    'defaultAmount',
  );
  @override
  late final GeneratedColumn<double> defaultAmount = GeneratedColumn<double>(
    'default_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    foodItemId,
    description,
    weightInGrams,
    defaultAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'serving_sizes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServingSize> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('food_item_id')) {
      context.handle(
        _foodItemIdMeta,
        foodItemId.isAcceptableOrUnknown(
          data['food_item_id']!,
          _foodItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_foodItemIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('weight_in_grams')) {
      context.handle(
        _weightInGramsMeta,
        weightInGrams.isAcceptableOrUnknown(
          data['weight_in_grams']!,
          _weightInGramsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weightInGramsMeta);
    }
    if (data.containsKey('default_amount')) {
      context.handle(
        _defaultAmountMeta,
        defaultAmount.isAcceptableOrUnknown(
          data['default_amount']!,
          _defaultAmountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServingSize map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServingSize(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      foodItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_item_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      weightInGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_in_grams'],
      )!,
      defaultAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}default_amount'],
      )!,
    );
  }

  @override
  $ServingSizesTable createAlias(String alias) {
    return $ServingSizesTable(attachedDatabase, alias);
  }
}

class ServingSize extends DataClass implements Insertable<ServingSize> {
  final String id;
  final String foodItemId;
  final String description;
  final double weightInGrams;
  final double defaultAmount;
  const ServingSize({
    required this.id,
    required this.foodItemId,
    required this.description,
    required this.weightInGrams,
    required this.defaultAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['food_item_id'] = Variable<String>(foodItemId);
    map['description'] = Variable<String>(description);
    map['weight_in_grams'] = Variable<double>(weightInGrams);
    map['default_amount'] = Variable<double>(defaultAmount);
    return map;
  }

  ServingSizesCompanion toCompanion(bool nullToAbsent) {
    return ServingSizesCompanion(
      id: Value(id),
      foodItemId: Value(foodItemId),
      description: Value(description),
      weightInGrams: Value(weightInGrams),
      defaultAmount: Value(defaultAmount),
    );
  }

  factory ServingSize.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServingSize(
      id: serializer.fromJson<String>(json['id']),
      foodItemId: serializer.fromJson<String>(json['foodItemId']),
      description: serializer.fromJson<String>(json['description']),
      weightInGrams: serializer.fromJson<double>(json['weightInGrams']),
      defaultAmount: serializer.fromJson<double>(json['defaultAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'foodItemId': serializer.toJson<String>(foodItemId),
      'description': serializer.toJson<String>(description),
      'weightInGrams': serializer.toJson<double>(weightInGrams),
      'defaultAmount': serializer.toJson<double>(defaultAmount),
    };
  }

  ServingSize copyWith({
    String? id,
    String? foodItemId,
    String? description,
    double? weightInGrams,
    double? defaultAmount,
  }) => ServingSize(
    id: id ?? this.id,
    foodItemId: foodItemId ?? this.foodItemId,
    description: description ?? this.description,
    weightInGrams: weightInGrams ?? this.weightInGrams,
    defaultAmount: defaultAmount ?? this.defaultAmount,
  );
  ServingSize copyWithCompanion(ServingSizesCompanion data) {
    return ServingSize(
      id: data.id.present ? data.id.value : this.id,
      foodItemId: data.foodItemId.present
          ? data.foodItemId.value
          : this.foodItemId,
      description: data.description.present
          ? data.description.value
          : this.description,
      weightInGrams: data.weightInGrams.present
          ? data.weightInGrams.value
          : this.weightInGrams,
      defaultAmount: data.defaultAmount.present
          ? data.defaultAmount.value
          : this.defaultAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServingSize(')
          ..write('id: $id, ')
          ..write('foodItemId: $foodItemId, ')
          ..write('description: $description, ')
          ..write('weightInGrams: $weightInGrams, ')
          ..write('defaultAmount: $defaultAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, foodItemId, description, weightInGrams, defaultAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServingSize &&
          other.id == this.id &&
          other.foodItemId == this.foodItemId &&
          other.description == this.description &&
          other.weightInGrams == this.weightInGrams &&
          other.defaultAmount == this.defaultAmount);
}

class ServingSizesCompanion extends UpdateCompanion<ServingSize> {
  final Value<String> id;
  final Value<String> foodItemId;
  final Value<String> description;
  final Value<double> weightInGrams;
  final Value<double> defaultAmount;
  final Value<int> rowid;
  const ServingSizesCompanion({
    this.id = const Value.absent(),
    this.foodItemId = const Value.absent(),
    this.description = const Value.absent(),
    this.weightInGrams = const Value.absent(),
    this.defaultAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServingSizesCompanion.insert({
    required String id,
    required String foodItemId,
    required String description,
    required double weightInGrams,
    this.defaultAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       foodItemId = Value(foodItemId),
       description = Value(description),
       weightInGrams = Value(weightInGrams);
  static Insertable<ServingSize> custom({
    Expression<String>? id,
    Expression<String>? foodItemId,
    Expression<String>? description,
    Expression<double>? weightInGrams,
    Expression<double>? defaultAmount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (foodItemId != null) 'food_item_id': foodItemId,
      if (description != null) 'description': description,
      if (weightInGrams != null) 'weight_in_grams': weightInGrams,
      if (defaultAmount != null) 'default_amount': defaultAmount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServingSizesCompanion copyWith({
    Value<String>? id,
    Value<String>? foodItemId,
    Value<String>? description,
    Value<double>? weightInGrams,
    Value<double>? defaultAmount,
    Value<int>? rowid,
  }) {
    return ServingSizesCompanion(
      id: id ?? this.id,
      foodItemId: foodItemId ?? this.foodItemId,
      description: description ?? this.description,
      weightInGrams: weightInGrams ?? this.weightInGrams,
      defaultAmount: defaultAmount ?? this.defaultAmount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (foodItemId.present) {
      map['food_item_id'] = Variable<String>(foodItemId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (weightInGrams.present) {
      map['weight_in_grams'] = Variable<double>(weightInGrams.value);
    }
    if (defaultAmount.present) {
      map['default_amount'] = Variable<double>(defaultAmount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServingSizesCompanion(')
          ..write('id: $id, ')
          ..write('foodItemId: $foodItemId, ')
          ..write('description: $description, ')
          ..write('weightInGrams: $weightInGrams, ')
          ..write('defaultAmount: $defaultAmount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BarcodeEntitiesTable extends BarcodeEntities
    with TableInfo<$BarcodeEntitiesTable, BarcodeEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarcodeEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foodItemIdMeta = const VerificationMeta(
    'foodItemId',
  );
  @override
  late final GeneratedColumn<String> foodItemId = GeneratedColumn<String>(
    'food_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scannedAtMeta = const VerificationMeta(
    'scannedAt',
  );
  @override
  late final GeneratedColumn<DateTime> scannedAt = GeneratedColumn<DateTime>(
    'scanned_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [barcode, foodItemId, scannedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barcode_entities';
  @override
  VerificationContext validateIntegrity(
    Insertable<BarcodeEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('food_item_id')) {
      context.handle(
        _foodItemIdMeta,
        foodItemId.isAcceptableOrUnknown(
          data['food_item_id']!,
          _foodItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_foodItemIdMeta);
    }
    if (data.containsKey('scanned_at')) {
      context.handle(
        _scannedAtMeta,
        scannedAt.isAcceptableOrUnknown(data['scanned_at']!, _scannedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_scannedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {barcode};
  @override
  BarcodeEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BarcodeEntity(
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      )!,
      foodItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_item_id'],
      )!,
      scannedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scanned_at'],
      )!,
    );
  }

  @override
  $BarcodeEntitiesTable createAlias(String alias) {
    return $BarcodeEntitiesTable(attachedDatabase, alias);
  }
}

class BarcodeEntity extends DataClass implements Insertable<BarcodeEntity> {
  final String barcode;
  final String foodItemId;
  final DateTime scannedAt;
  const BarcodeEntity({
    required this.barcode,
    required this.foodItemId,
    required this.scannedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['barcode'] = Variable<String>(barcode);
    map['food_item_id'] = Variable<String>(foodItemId);
    map['scanned_at'] = Variable<DateTime>(scannedAt);
    return map;
  }

  BarcodeEntitiesCompanion toCompanion(bool nullToAbsent) {
    return BarcodeEntitiesCompanion(
      barcode: Value(barcode),
      foodItemId: Value(foodItemId),
      scannedAt: Value(scannedAt),
    );
  }

  factory BarcodeEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BarcodeEntity(
      barcode: serializer.fromJson<String>(json['barcode']),
      foodItemId: serializer.fromJson<String>(json['foodItemId']),
      scannedAt: serializer.fromJson<DateTime>(json['scannedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'barcode': serializer.toJson<String>(barcode),
      'foodItemId': serializer.toJson<String>(foodItemId),
      'scannedAt': serializer.toJson<DateTime>(scannedAt),
    };
  }

  BarcodeEntity copyWith({
    String? barcode,
    String? foodItemId,
    DateTime? scannedAt,
  }) => BarcodeEntity(
    barcode: barcode ?? this.barcode,
    foodItemId: foodItemId ?? this.foodItemId,
    scannedAt: scannedAt ?? this.scannedAt,
  );
  BarcodeEntity copyWithCompanion(BarcodeEntitiesCompanion data) {
    return BarcodeEntity(
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      foodItemId: data.foodItemId.present
          ? data.foodItemId.value
          : this.foodItemId,
      scannedAt: data.scannedAt.present ? data.scannedAt.value : this.scannedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BarcodeEntity(')
          ..write('barcode: $barcode, ')
          ..write('foodItemId: $foodItemId, ')
          ..write('scannedAt: $scannedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(barcode, foodItemId, scannedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BarcodeEntity &&
          other.barcode == this.barcode &&
          other.foodItemId == this.foodItemId &&
          other.scannedAt == this.scannedAt);
}

class BarcodeEntitiesCompanion extends UpdateCompanion<BarcodeEntity> {
  final Value<String> barcode;
  final Value<String> foodItemId;
  final Value<DateTime> scannedAt;
  final Value<int> rowid;
  const BarcodeEntitiesCompanion({
    this.barcode = const Value.absent(),
    this.foodItemId = const Value.absent(),
    this.scannedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BarcodeEntitiesCompanion.insert({
    required String barcode,
    required String foodItemId,
    required DateTime scannedAt,
    this.rowid = const Value.absent(),
  }) : barcode = Value(barcode),
       foodItemId = Value(foodItemId),
       scannedAt = Value(scannedAt);
  static Insertable<BarcodeEntity> custom({
    Expression<String>? barcode,
    Expression<String>? foodItemId,
    Expression<DateTime>? scannedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (barcode != null) 'barcode': barcode,
      if (foodItemId != null) 'food_item_id': foodItemId,
      if (scannedAt != null) 'scanned_at': scannedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BarcodeEntitiesCompanion copyWith({
    Value<String>? barcode,
    Value<String>? foodItemId,
    Value<DateTime>? scannedAt,
    Value<int>? rowid,
  }) {
    return BarcodeEntitiesCompanion(
      barcode: barcode ?? this.barcode,
      foodItemId: foodItemId ?? this.foodItemId,
      scannedAt: scannedAt ?? this.scannedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (foodItemId.present) {
      map['food_item_id'] = Variable<String>(foodItemId.value);
    }
    if (scannedAt.present) {
      map['scanned_at'] = Variable<DateTime>(scannedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarcodeEntitiesCompanion(')
          ..write('barcode: $barcode, ')
          ..write('foodItemId: $foodItemId, ')
          ..write('scannedAt: $scannedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealRecordsTable extends MealRecords
    with TableInfo<$MealRecordsTable, MealRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $MealRecordsTable createAlias(String alias) {
    return $MealRecordsTable(attachedDatabase, alias);
  }
}

class MealRecord extends DataClass implements Insertable<MealRecord> {
  final String id;
  final DateTime date;
  const MealRecord({required this.id, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  MealRecordsCompanion toCompanion(bool nullToAbsent) {
    return MealRecordsCompanion(id: Value(id), date: Value(date));
  }

  factory MealRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealRecord(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  MealRecord copyWith({String? id, DateTime? date}) =>
      MealRecord(id: id ?? this.id, date: date ?? this.date);
  MealRecord copyWithCompanion(MealRecordsCompanion data) {
    return MealRecord(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealRecord(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealRecord && other.id == this.id && other.date == this.date);
}

class MealRecordsCompanion extends UpdateCompanion<MealRecord> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<int> rowid;
  const MealRecordsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealRecordsCompanion.insert({
    required String id,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date);
  static Insertable<MealRecord> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealRecordsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return MealRecordsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealRecordsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealEntriesTable extends MealEntries
    with TableInfo<$MealEntriesTable, MealEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealRecordIdMeta = const VerificationMeta(
    'mealRecordId',
  );
  @override
  late final GeneratedColumn<String> mealRecordId = GeneratedColumn<String>(
    'meal_record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_records (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _mealTypeMeta = const VerificationMeta(
    'mealType',
  );
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
    'meal_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foodItemIdMeta = const VerificationMeta(
    'foodItemId',
  );
  @override
  late final GeneratedColumn<String> foodItemId = GeneratedColumn<String>(
    'food_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES food_items (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingDescriptionMeta =
      const VerificationMeta('servingDescription');
  @override
  late final GeneratedColumn<String> servingDescription =
      GeneratedColumn<String>(
        'serving_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _servingWeightGramsMeta =
      const VerificationMeta('servingWeightGrams');
  @override
  late final GeneratedColumn<double> servingWeightGrams =
      GeneratedColumn<double>(
        'serving_weight_grams',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mealRecordId,
    mealType,
    foodItemId,
    quantity,
    servingDescription,
    servingWeightGrams,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meal_record_id')) {
      context.handle(
        _mealRecordIdMeta,
        mealRecordId.isAcceptableOrUnknown(
          data['meal_record_id']!,
          _mealRecordIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mealRecordIdMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(
        _mealTypeMeta,
        mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('food_item_id')) {
      context.handle(
        _foodItemIdMeta,
        foodItemId.isAcceptableOrUnknown(
          data['food_item_id']!,
          _foodItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_foodItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('serving_description')) {
      context.handle(
        _servingDescriptionMeta,
        servingDescription.isAcceptableOrUnknown(
          data['serving_description']!,
          _servingDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingDescriptionMeta);
    }
    if (data.containsKey('serving_weight_grams')) {
      context.handle(
        _servingWeightGramsMeta,
        servingWeightGrams.isAcceptableOrUnknown(
          data['serving_weight_grams']!,
          _servingWeightGramsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingWeightGramsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mealRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_record_id'],
      )!,
      mealType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_type'],
      )!,
      foodItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_item_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      servingDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serving_description'],
      )!,
      servingWeightGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}serving_weight_grams'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MealEntriesTable createAlias(String alias) {
    return $MealEntriesTable(attachedDatabase, alias);
  }
}

class MealEntry extends DataClass implements Insertable<MealEntry> {
  final String id;
  final String mealRecordId;
  final String mealType;
  final String foodItemId;
  final double quantity;
  final String servingDescription;
  final double servingWeightGrams;
  final DateTime createdAt;
  const MealEntry({
    required this.id,
    required this.mealRecordId,
    required this.mealType,
    required this.foodItemId,
    required this.quantity,
    required this.servingDescription,
    required this.servingWeightGrams,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['meal_record_id'] = Variable<String>(mealRecordId);
    map['meal_type'] = Variable<String>(mealType);
    map['food_item_id'] = Variable<String>(foodItemId);
    map['quantity'] = Variable<double>(quantity);
    map['serving_description'] = Variable<String>(servingDescription);
    map['serving_weight_grams'] = Variable<double>(servingWeightGrams);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MealEntriesCompanion toCompanion(bool nullToAbsent) {
    return MealEntriesCompanion(
      id: Value(id),
      mealRecordId: Value(mealRecordId),
      mealType: Value(mealType),
      foodItemId: Value(foodItemId),
      quantity: Value(quantity),
      servingDescription: Value(servingDescription),
      servingWeightGrams: Value(servingWeightGrams),
      createdAt: Value(createdAt),
    );
  }

  factory MealEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealEntry(
      id: serializer.fromJson<String>(json['id']),
      mealRecordId: serializer.fromJson<String>(json['mealRecordId']),
      mealType: serializer.fromJson<String>(json['mealType']),
      foodItemId: serializer.fromJson<String>(json['foodItemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      servingDescription: serializer.fromJson<String>(
        json['servingDescription'],
      ),
      servingWeightGrams: serializer.fromJson<double>(
        json['servingWeightGrams'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mealRecordId': serializer.toJson<String>(mealRecordId),
      'mealType': serializer.toJson<String>(mealType),
      'foodItemId': serializer.toJson<String>(foodItemId),
      'quantity': serializer.toJson<double>(quantity),
      'servingDescription': serializer.toJson<String>(servingDescription),
      'servingWeightGrams': serializer.toJson<double>(servingWeightGrams),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MealEntry copyWith({
    String? id,
    String? mealRecordId,
    String? mealType,
    String? foodItemId,
    double? quantity,
    String? servingDescription,
    double? servingWeightGrams,
    DateTime? createdAt,
  }) => MealEntry(
    id: id ?? this.id,
    mealRecordId: mealRecordId ?? this.mealRecordId,
    mealType: mealType ?? this.mealType,
    foodItemId: foodItemId ?? this.foodItemId,
    quantity: quantity ?? this.quantity,
    servingDescription: servingDescription ?? this.servingDescription,
    servingWeightGrams: servingWeightGrams ?? this.servingWeightGrams,
    createdAt: createdAt ?? this.createdAt,
  );
  MealEntry copyWithCompanion(MealEntriesCompanion data) {
    return MealEntry(
      id: data.id.present ? data.id.value : this.id,
      mealRecordId: data.mealRecordId.present
          ? data.mealRecordId.value
          : this.mealRecordId,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      foodItemId: data.foodItemId.present
          ? data.foodItemId.value
          : this.foodItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      servingDescription: data.servingDescription.present
          ? data.servingDescription.value
          : this.servingDescription,
      servingWeightGrams: data.servingWeightGrams.present
          ? data.servingWeightGrams.value
          : this.servingWeightGrams,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealEntry(')
          ..write('id: $id, ')
          ..write('mealRecordId: $mealRecordId, ')
          ..write('mealType: $mealType, ')
          ..write('foodItemId: $foodItemId, ')
          ..write('quantity: $quantity, ')
          ..write('servingDescription: $servingDescription, ')
          ..write('servingWeightGrams: $servingWeightGrams, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mealRecordId,
    mealType,
    foodItemId,
    quantity,
    servingDescription,
    servingWeightGrams,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealEntry &&
          other.id == this.id &&
          other.mealRecordId == this.mealRecordId &&
          other.mealType == this.mealType &&
          other.foodItemId == this.foodItemId &&
          other.quantity == this.quantity &&
          other.servingDescription == this.servingDescription &&
          other.servingWeightGrams == this.servingWeightGrams &&
          other.createdAt == this.createdAt);
}

class MealEntriesCompanion extends UpdateCompanion<MealEntry> {
  final Value<String> id;
  final Value<String> mealRecordId;
  final Value<String> mealType;
  final Value<String> foodItemId;
  final Value<double> quantity;
  final Value<String> servingDescription;
  final Value<double> servingWeightGrams;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MealEntriesCompanion({
    this.id = const Value.absent(),
    this.mealRecordId = const Value.absent(),
    this.mealType = const Value.absent(),
    this.foodItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.servingDescription = const Value.absent(),
    this.servingWeightGrams = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealEntriesCompanion.insert({
    required String id,
    required String mealRecordId,
    required String mealType,
    required String foodItemId,
    required double quantity,
    required String servingDescription,
    required double servingWeightGrams,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mealRecordId = Value(mealRecordId),
       mealType = Value(mealType),
       foodItemId = Value(foodItemId),
       quantity = Value(quantity),
       servingDescription = Value(servingDescription),
       servingWeightGrams = Value(servingWeightGrams),
       createdAt = Value(createdAt);
  static Insertable<MealEntry> custom({
    Expression<String>? id,
    Expression<String>? mealRecordId,
    Expression<String>? mealType,
    Expression<String>? foodItemId,
    Expression<double>? quantity,
    Expression<String>? servingDescription,
    Expression<double>? servingWeightGrams,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealRecordId != null) 'meal_record_id': mealRecordId,
      if (mealType != null) 'meal_type': mealType,
      if (foodItemId != null) 'food_item_id': foodItemId,
      if (quantity != null) 'quantity': quantity,
      if (servingDescription != null) 'serving_description': servingDescription,
      if (servingWeightGrams != null)
        'serving_weight_grams': servingWeightGrams,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? mealRecordId,
    Value<String>? mealType,
    Value<String>? foodItemId,
    Value<double>? quantity,
    Value<String>? servingDescription,
    Value<double>? servingWeightGrams,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MealEntriesCompanion(
      id: id ?? this.id,
      mealRecordId: mealRecordId ?? this.mealRecordId,
      mealType: mealType ?? this.mealType,
      foodItemId: foodItemId ?? this.foodItemId,
      quantity: quantity ?? this.quantity,
      servingDescription: servingDescription ?? this.servingDescription,
      servingWeightGrams: servingWeightGrams ?? this.servingWeightGrams,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mealRecordId.present) {
      map['meal_record_id'] = Variable<String>(mealRecordId.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (foodItemId.present) {
      map['food_item_id'] = Variable<String>(foodItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (servingDescription.present) {
      map['serving_description'] = Variable<String>(servingDescription.value);
    }
    if (servingWeightGrams.present) {
      map['serving_weight_grams'] = Variable<double>(servingWeightGrams.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealEntriesCompanion(')
          ..write('id: $id, ')
          ..write('mealRecordId: $mealRecordId, ')
          ..write('mealType: $mealType, ')
          ..write('foodItemId: $foodItemId, ')
          ..write('quantity: $quantity, ')
          ..write('servingDescription: $servingDescription, ')
          ..write('servingWeightGrams: $servingWeightGrams, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WaterLogsTable extends WaterLogs
    with TableInfo<$WaterLogsTable, WaterLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMlMeta = const VerificationMeta(
    'amountMl',
  );
  @override
  late final GeneratedColumn<int> amountMl = GeneratedColumn<int>(
    'amount_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, amountMl, date, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WaterLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount_ml')) {
      context.handle(
        _amountMlMeta,
        amountMl.isAcceptableOrUnknown(data['amount_ml']!, _amountMlMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMlMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      amountMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_ml'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WaterLogsTable createAlias(String alias) {
    return $WaterLogsTable(attachedDatabase, alias);
  }
}

class WaterLog extends DataClass implements Insertable<WaterLog> {
  final String id;
  final int amountMl;
  final DateTime date;
  final DateTime createdAt;
  const WaterLog({
    required this.id,
    required this.amountMl,
    required this.date,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount_ml'] = Variable<int>(amountMl);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WaterLogsCompanion toCompanion(bool nullToAbsent) {
    return WaterLogsCompanion(
      id: Value(id),
      amountMl: Value(amountMl),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory WaterLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterLog(
      id: serializer.fromJson<String>(json['id']),
      amountMl: serializer.fromJson<int>(json['amountMl']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amountMl': serializer.toJson<int>(amountMl),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WaterLog copyWith({
    String? id,
    int? amountMl,
    DateTime? date,
    DateTime? createdAt,
  }) => WaterLog(
    id: id ?? this.id,
    amountMl: amountMl ?? this.amountMl,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
  );
  WaterLog copyWithCompanion(WaterLogsCompanion data) {
    return WaterLog(
      id: data.id.present ? data.id.value : this.id,
      amountMl: data.amountMl.present ? data.amountMl.value : this.amountMl,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterLog(')
          ..write('id: $id, ')
          ..write('amountMl: $amountMl, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amountMl, date, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterLog &&
          other.id == this.id &&
          other.amountMl == this.amountMl &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class WaterLogsCompanion extends UpdateCompanion<WaterLog> {
  final Value<String> id;
  final Value<int> amountMl;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const WaterLogsCompanion({
    this.id = const Value.absent(),
    this.amountMl = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WaterLogsCompanion.insert({
    required String id,
    required int amountMl,
    required DateTime date,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       amountMl = Value(amountMl),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<WaterLog> custom({
    Expression<String>? id,
    Expression<int>? amountMl,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountMl != null) 'amount_ml': amountMl,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WaterLogsCompanion copyWith({
    Value<String>? id,
    Value<int>? amountMl,
    Value<DateTime>? date,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return WaterLogsCompanion(
      id: id ?? this.id,
      amountMl: amountMl ?? this.amountMl,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amountMl.present) {
      map['amount_ml'] = Variable<int>(amountMl.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterLogsCompanion(')
          ..write('id: $id, ')
          ..write('amountMl: $amountMl, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeightLogsTable extends WeightLogs
    with TableInfo<$WeightLogsTable, WeightLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, weightKg, date, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeightLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeightLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $WeightLogsTable createAlias(String alias) {
    return $WeightLogsTable(attachedDatabase, alias);
  }
}

class WeightLog extends DataClass implements Insertable<WeightLog> {
  final String id;
  final double weightKg;
  final DateTime date;
  final String? notes;
  const WeightLog({
    required this.id,
    required this.weightKg,
    required this.date,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['weight_kg'] = Variable<double>(weightKg);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  WeightLogsCompanion toCompanion(bool nullToAbsent) {
    return WeightLogsCompanion(
      id: Value(id),
      weightKg: Value(weightKg),
      date: Value(date),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory WeightLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightLog(
      id: serializer.fromJson<String>(json['id']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weightKg': serializer.toJson<double>(weightKg),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  WeightLog copyWith({
    String? id,
    double? weightKg,
    DateTime? date,
    Value<String?> notes = const Value.absent(),
  }) => WeightLog(
    id: id ?? this.id,
    weightKg: weightKg ?? this.weightKg,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
  );
  WeightLog copyWithCompanion(WeightLogsCompanion data) {
    return WeightLog(
      id: data.id.present ? data.id.value : this.id,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightLog(')
          ..write('id: $id, ')
          ..write('weightKg: $weightKg, ')
          ..write('date: $date, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weightKg, date, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightLog &&
          other.id == this.id &&
          other.weightKg == this.weightKg &&
          other.date == this.date &&
          other.notes == this.notes);
}

class WeightLogsCompanion extends UpdateCompanion<WeightLog> {
  final Value<String> id;
  final Value<double> weightKg;
  final Value<DateTime> date;
  final Value<String?> notes;
  final Value<int> rowid;
  const WeightLogsCompanion({
    this.id = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeightLogsCompanion.insert({
    required String id,
    required double weightKg,
    required DateTime date,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weightKg = Value(weightKg),
       date = Value(date);
  static Insertable<WeightLog> custom({
    Expression<String>? id,
    Expression<double>? weightKg,
    Expression<DateTime>? date,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weightKg != null) 'weight_kg': weightKg,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeightLogsCompanion copyWith({
    Value<String>? id,
    Value<double>? weightKg,
    Value<DateTime>? date,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return WeightLogsCompanion(
      id: id ?? this.id,
      weightKg: weightKg ?? this.weightKg,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightLogsCompanion(')
          ..write('id: $id, ')
          ..write('weightKg: $weightKg, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecentFoodsByMealTable extends RecentFoodsByMeal
    with TableInfo<$RecentFoodsByMealTable, RecentFoodsByMealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentFoodsByMealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _foodItemIdMeta = const VerificationMeta(
    'foodItemId',
  );
  @override
  late final GeneratedColumn<String> foodItemId = GeneratedColumn<String>(
    'food_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealTypeMeta = const VerificationMeta(
    'mealType',
  );
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
    'meal_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUsedAtMeta = const VerificationMeta(
    'lastUsedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
    'last_used_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _useCountMeta = const VerificationMeta(
    'useCount',
  );
  @override
  late final GeneratedColumn<int> useCount = GeneratedColumn<int>(
    'use_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    foodItemId,
    mealType,
    lastUsedAt,
    useCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recent_foods_by_meal';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecentFoodsByMealData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('food_item_id')) {
      context.handle(
        _foodItemIdMeta,
        foodItemId.isAcceptableOrUnknown(
          data['food_item_id']!,
          _foodItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_foodItemIdMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(
        _mealTypeMeta,
        mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
        _lastUsedAtMeta,
        lastUsedAt.isAcceptableOrUnknown(
          data['last_used_at']!,
          _lastUsedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastUsedAtMeta);
    }
    if (data.containsKey('use_count')) {
      context.handle(
        _useCountMeta,
        useCount.isAcceptableOrUnknown(data['use_count']!, _useCountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {foodItemId, mealType};
  @override
  RecentFoodsByMealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentFoodsByMealData(
      foodItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_item_id'],
      )!,
      mealType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_type'],
      )!,
      lastUsedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_used_at'],
      )!,
      useCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}use_count'],
      )!,
    );
  }

  @override
  $RecentFoodsByMealTable createAlias(String alias) {
    return $RecentFoodsByMealTable(attachedDatabase, alias);
  }
}

class RecentFoodsByMealData extends DataClass
    implements Insertable<RecentFoodsByMealData> {
  final String foodItemId;
  final String mealType;
  final DateTime lastUsedAt;
  final int useCount;
  const RecentFoodsByMealData({
    required this.foodItemId,
    required this.mealType,
    required this.lastUsedAt,
    required this.useCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['food_item_id'] = Variable<String>(foodItemId);
    map['meal_type'] = Variable<String>(mealType);
    map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    map['use_count'] = Variable<int>(useCount);
    return map;
  }

  RecentFoodsByMealCompanion toCompanion(bool nullToAbsent) {
    return RecentFoodsByMealCompanion(
      foodItemId: Value(foodItemId),
      mealType: Value(mealType),
      lastUsedAt: Value(lastUsedAt),
      useCount: Value(useCount),
    );
  }

  factory RecentFoodsByMealData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentFoodsByMealData(
      foodItemId: serializer.fromJson<String>(json['foodItemId']),
      mealType: serializer.fromJson<String>(json['mealType']),
      lastUsedAt: serializer.fromJson<DateTime>(json['lastUsedAt']),
      useCount: serializer.fromJson<int>(json['useCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'foodItemId': serializer.toJson<String>(foodItemId),
      'mealType': serializer.toJson<String>(mealType),
      'lastUsedAt': serializer.toJson<DateTime>(lastUsedAt),
      'useCount': serializer.toJson<int>(useCount),
    };
  }

  RecentFoodsByMealData copyWith({
    String? foodItemId,
    String? mealType,
    DateTime? lastUsedAt,
    int? useCount,
  }) => RecentFoodsByMealData(
    foodItemId: foodItemId ?? this.foodItemId,
    mealType: mealType ?? this.mealType,
    lastUsedAt: lastUsedAt ?? this.lastUsedAt,
    useCount: useCount ?? this.useCount,
  );
  RecentFoodsByMealData copyWithCompanion(RecentFoodsByMealCompanion data) {
    return RecentFoodsByMealData(
      foodItemId: data.foodItemId.present
          ? data.foodItemId.value
          : this.foodItemId,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      lastUsedAt: data.lastUsedAt.present
          ? data.lastUsedAt.value
          : this.lastUsedAt,
      useCount: data.useCount.present ? data.useCount.value : this.useCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecentFoodsByMealData(')
          ..write('foodItemId: $foodItemId, ')
          ..write('mealType: $mealType, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('useCount: $useCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(foodItemId, mealType, lastUsedAt, useCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentFoodsByMealData &&
          other.foodItemId == this.foodItemId &&
          other.mealType == this.mealType &&
          other.lastUsedAt == this.lastUsedAt &&
          other.useCount == this.useCount);
}

class RecentFoodsByMealCompanion
    extends UpdateCompanion<RecentFoodsByMealData> {
  final Value<String> foodItemId;
  final Value<String> mealType;
  final Value<DateTime> lastUsedAt;
  final Value<int> useCount;
  final Value<int> rowid;
  const RecentFoodsByMealCompanion({
    this.foodItemId = const Value.absent(),
    this.mealType = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentFoodsByMealCompanion.insert({
    required String foodItemId,
    required String mealType,
    required DateTime lastUsedAt,
    this.useCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : foodItemId = Value(foodItemId),
       mealType = Value(mealType),
       lastUsedAt = Value(lastUsedAt);
  static Insertable<RecentFoodsByMealData> custom({
    Expression<String>? foodItemId,
    Expression<String>? mealType,
    Expression<DateTime>? lastUsedAt,
    Expression<int>? useCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (foodItemId != null) 'food_item_id': foodItemId,
      if (mealType != null) 'meal_type': mealType,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (useCount != null) 'use_count': useCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentFoodsByMealCompanion copyWith({
    Value<String>? foodItemId,
    Value<String>? mealType,
    Value<DateTime>? lastUsedAt,
    Value<int>? useCount,
    Value<int>? rowid,
  }) {
    return RecentFoodsByMealCompanion(
      foodItemId: foodItemId ?? this.foodItemId,
      mealType: mealType ?? this.mealType,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      useCount: useCount ?? this.useCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (foodItemId.present) {
      map['food_item_id'] = Variable<String>(foodItemId.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (useCount.present) {
      map['use_count'] = Variable<int>(useCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentFoodsByMealCompanion(')
          ..write('foodItemId: $foodItemId, ')
          ..write('mealType: $mealType, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('useCount: $useCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FoodItemsTable foodItems = $FoodItemsTable(this);
  late final $ServingSizesTable servingSizes = $ServingSizesTable(this);
  late final $BarcodeEntitiesTable barcodeEntities = $BarcodeEntitiesTable(
    this,
  );
  late final $MealRecordsTable mealRecords = $MealRecordsTable(this);
  late final $MealEntriesTable mealEntries = $MealEntriesTable(this);
  late final $WaterLogsTable waterLogs = $WaterLogsTable(this);
  late final $WeightLogsTable weightLogs = $WeightLogsTable(this);
  late final $RecentFoodsByMealTable recentFoodsByMeal =
      $RecentFoodsByMealTable(this);
  late final MealDiaryDao mealDiaryDao = MealDiaryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    foodItems,
    servingSizes,
    barcodeEntities,
    mealRecords,
    mealEntries,
    waterLogs,
    weightLogs,
    recentFoodsByMeal,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'food_items',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('serving_sizes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'meal_records',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meal_entries', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$FoodItemsTableCreateCompanionBuilder =
    FoodItemsCompanion Function({
      required String id,
      required String name,
      required String source,
      required double calories,
      required double protein,
      required double carbohydrates,
      required double fat,
      required double fiber,
      Value<double?> sodium,
      Value<bool> isDeleted,
      Value<int> version,
      Value<int> rowid,
    });
typedef $$FoodItemsTableUpdateCompanionBuilder =
    FoodItemsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> source,
      Value<double> calories,
      Value<double> protein,
      Value<double> carbohydrates,
      Value<double> fat,
      Value<double> fiber,
      Value<double?> sodium,
      Value<bool> isDeleted,
      Value<int> version,
      Value<int> rowid,
    });

final class $$FoodItemsTableReferences
    extends BaseReferences<_$AppDatabase, $FoodItemsTable, FoodItem> {
  $$FoodItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ServingSizesTable, List<ServingSize>>
  _servingSizesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.servingSizes,
    aliasName: $_aliasNameGenerator(
      db.foodItems.id,
      db.servingSizes.foodItemId,
    ),
  );

  $$ServingSizesTableProcessedTableManager get servingSizesRefs {
    final manager = $$ServingSizesTableTableManager(
      $_db,
      $_db.servingSizes,
    ).filter((f) => f.foodItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_servingSizesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealEntriesTable, List<MealEntry>>
  _mealEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealEntries,
    aliasName: $_aliasNameGenerator(db.foodItems.id, db.mealEntries.foodItemId),
  );

  $$MealEntriesTableProcessedTableManager get mealEntriesRefs {
    final manager = $$MealEntriesTableTableManager(
      $_db,
      $_db.mealEntries,
    ).filter((f) => f.foodItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FoodItemsTableFilterComposer
    extends Composer<_$AppDatabase, $FoodItemsTable> {
  $$FoodItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiber => $composableBuilder(
    column: $table.fiber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sodium => $composableBuilder(
    column: $table.sodium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> servingSizesRefs(
    Expression<bool> Function($$ServingSizesTableFilterComposer f) f,
  ) {
    final $$ServingSizesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.servingSizes,
      getReferencedColumn: (t) => t.foodItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServingSizesTableFilterComposer(
            $db: $db,
            $table: $db.servingSizes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealEntriesRefs(
    Expression<bool> Function($$MealEntriesTableFilterComposer f) f,
  ) {
    final $$MealEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.foodItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableFilterComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoodItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodItemsTable> {
  $$FoodItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiber => $composableBuilder(
    column: $table.fiber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sodium => $composableBuilder(
    column: $table.sodium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoodItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodItemsTable> {
  $$FoodItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get fiber =>
      $composableBuilder(column: $table.fiber, builder: (column) => column);

  GeneratedColumn<double> get sodium =>
      $composableBuilder(column: $table.sodium, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  Expression<T> servingSizesRefs<T extends Object>(
    Expression<T> Function($$ServingSizesTableAnnotationComposer a) f,
  ) {
    final $$ServingSizesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.servingSizes,
      getReferencedColumn: (t) => t.foodItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServingSizesTableAnnotationComposer(
            $db: $db,
            $table: $db.servingSizes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealEntriesRefs<T extends Object>(
    Expression<T> Function($$MealEntriesTableAnnotationComposer a) f,
  ) {
    final $$MealEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.foodItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FoodItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodItemsTable,
          FoodItem,
          $$FoodItemsTableFilterComposer,
          $$FoodItemsTableOrderingComposer,
          $$FoodItemsTableAnnotationComposer,
          $$FoodItemsTableCreateCompanionBuilder,
          $$FoodItemsTableUpdateCompanionBuilder,
          (FoodItem, $$FoodItemsTableReferences),
          FoodItem,
          PrefetchHooks Function({bool servingSizesRefs, bool mealEntriesRefs})
        > {
  $$FoodItemsTableTableManager(_$AppDatabase db, $FoodItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> carbohydrates = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> fiber = const Value.absent(),
                Value<double?> sodium = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodItemsCompanion(
                id: id,
                name: name,
                source: source,
                calories: calories,
                protein: protein,
                carbohydrates: carbohydrates,
                fat: fat,
                fiber: fiber,
                sodium: sodium,
                isDeleted: isDeleted,
                version: version,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String source,
                required double calories,
                required double protein,
                required double carbohydrates,
                required double fat,
                required double fiber,
                Value<double?> sodium = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodItemsCompanion.insert(
                id: id,
                name: name,
                source: source,
                calories: calories,
                protein: protein,
                carbohydrates: carbohydrates,
                fat: fat,
                fiber: fiber,
                sodium: sodium,
                isDeleted: isDeleted,
                version: version,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FoodItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({servingSizesRefs = false, mealEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (servingSizesRefs) db.servingSizes,
                    if (mealEntriesRefs) db.mealEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (servingSizesRefs)
                        await $_getPrefetchedData<
                          FoodItem,
                          $FoodItemsTable,
                          ServingSize
                        >(
                          currentTable: table,
                          referencedTable: $$FoodItemsTableReferences
                              ._servingSizesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FoodItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).servingSizesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.foodItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mealEntriesRefs)
                        await $_getPrefetchedData<
                          FoodItem,
                          $FoodItemsTable,
                          MealEntry
                        >(
                          currentTable: table,
                          referencedTable: $$FoodItemsTableReferences
                              ._mealEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FoodItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.foodItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FoodItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodItemsTable,
      FoodItem,
      $$FoodItemsTableFilterComposer,
      $$FoodItemsTableOrderingComposer,
      $$FoodItemsTableAnnotationComposer,
      $$FoodItemsTableCreateCompanionBuilder,
      $$FoodItemsTableUpdateCompanionBuilder,
      (FoodItem, $$FoodItemsTableReferences),
      FoodItem,
      PrefetchHooks Function({bool servingSizesRefs, bool mealEntriesRefs})
    >;
typedef $$ServingSizesTableCreateCompanionBuilder =
    ServingSizesCompanion Function({
      required String id,
      required String foodItemId,
      required String description,
      required double weightInGrams,
      Value<double> defaultAmount,
      Value<int> rowid,
    });
typedef $$ServingSizesTableUpdateCompanionBuilder =
    ServingSizesCompanion Function({
      Value<String> id,
      Value<String> foodItemId,
      Value<String> description,
      Value<double> weightInGrams,
      Value<double> defaultAmount,
      Value<int> rowid,
    });

final class $$ServingSizesTableReferences
    extends BaseReferences<_$AppDatabase, $ServingSizesTable, ServingSize> {
  $$ServingSizesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FoodItemsTable _foodItemIdTable(_$AppDatabase db) =>
      db.foodItems.createAlias(
        $_aliasNameGenerator(db.servingSizes.foodItemId, db.foodItems.id),
      );

  $$FoodItemsTableProcessedTableManager get foodItemId {
    final $_column = $_itemColumn<String>('food_item_id')!;

    final manager = $$FoodItemsTableTableManager(
      $_db,
      $_db.foodItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_foodItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ServingSizesTableFilterComposer
    extends Composer<_$AppDatabase, $ServingSizesTable> {
  $$ServingSizesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightInGrams => $composableBuilder(
    column: $table.weightInGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get defaultAmount => $composableBuilder(
    column: $table.defaultAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$FoodItemsTableFilterComposer get foodItemId {
    final $$FoodItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodItemId,
      referencedTable: $db.foodItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodItemsTableFilterComposer(
            $db: $db,
            $table: $db.foodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServingSizesTableOrderingComposer
    extends Composer<_$AppDatabase, $ServingSizesTable> {
  $$ServingSizesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightInGrams => $composableBuilder(
    column: $table.weightInGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get defaultAmount => $composableBuilder(
    column: $table.defaultAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$FoodItemsTableOrderingComposer get foodItemId {
    final $$FoodItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodItemId,
      referencedTable: $db.foodItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodItemsTableOrderingComposer(
            $db: $db,
            $table: $db.foodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServingSizesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServingSizesTable> {
  $$ServingSizesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightInGrams => $composableBuilder(
    column: $table.weightInGrams,
    builder: (column) => column,
  );

  GeneratedColumn<double> get defaultAmount => $composableBuilder(
    column: $table.defaultAmount,
    builder: (column) => column,
  );

  $$FoodItemsTableAnnotationComposer get foodItemId {
    final $$FoodItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodItemId,
      referencedTable: $db.foodItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.foodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServingSizesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServingSizesTable,
          ServingSize,
          $$ServingSizesTableFilterComposer,
          $$ServingSizesTableOrderingComposer,
          $$ServingSizesTableAnnotationComposer,
          $$ServingSizesTableCreateCompanionBuilder,
          $$ServingSizesTableUpdateCompanionBuilder,
          (ServingSize, $$ServingSizesTableReferences),
          ServingSize,
          PrefetchHooks Function({bool foodItemId})
        > {
  $$ServingSizesTableTableManager(_$AppDatabase db, $ServingSizesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServingSizesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServingSizesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServingSizesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> foodItemId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> weightInGrams = const Value.absent(),
                Value<double> defaultAmount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServingSizesCompanion(
                id: id,
                foodItemId: foodItemId,
                description: description,
                weightInGrams: weightInGrams,
                defaultAmount: defaultAmount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String foodItemId,
                required String description,
                required double weightInGrams,
                Value<double> defaultAmount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServingSizesCompanion.insert(
                id: id,
                foodItemId: foodItemId,
                description: description,
                weightInGrams: weightInGrams,
                defaultAmount: defaultAmount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServingSizesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({foodItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (foodItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.foodItemId,
                                referencedTable: $$ServingSizesTableReferences
                                    ._foodItemIdTable(db),
                                referencedColumn: $$ServingSizesTableReferences
                                    ._foodItemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ServingSizesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServingSizesTable,
      ServingSize,
      $$ServingSizesTableFilterComposer,
      $$ServingSizesTableOrderingComposer,
      $$ServingSizesTableAnnotationComposer,
      $$ServingSizesTableCreateCompanionBuilder,
      $$ServingSizesTableUpdateCompanionBuilder,
      (ServingSize, $$ServingSizesTableReferences),
      ServingSize,
      PrefetchHooks Function({bool foodItemId})
    >;
typedef $$BarcodeEntitiesTableCreateCompanionBuilder =
    BarcodeEntitiesCompanion Function({
      required String barcode,
      required String foodItemId,
      required DateTime scannedAt,
      Value<int> rowid,
    });
typedef $$BarcodeEntitiesTableUpdateCompanionBuilder =
    BarcodeEntitiesCompanion Function({
      Value<String> barcode,
      Value<String> foodItemId,
      Value<DateTime> scannedAt,
      Value<int> rowid,
    });

class $$BarcodeEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $BarcodeEntitiesTable> {
  $$BarcodeEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foodItemId => $composableBuilder(
    column: $table.foodItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scannedAt => $composableBuilder(
    column: $table.scannedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BarcodeEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $BarcodeEntitiesTable> {
  $$BarcodeEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodItemId => $composableBuilder(
    column: $table.foodItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scannedAt => $composableBuilder(
    column: $table.scannedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BarcodeEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BarcodeEntitiesTable> {
  $$BarcodeEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get foodItemId => $composableBuilder(
    column: $table.foodItemId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scannedAt =>
      $composableBuilder(column: $table.scannedAt, builder: (column) => column);
}

class $$BarcodeEntitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BarcodeEntitiesTable,
          BarcodeEntity,
          $$BarcodeEntitiesTableFilterComposer,
          $$BarcodeEntitiesTableOrderingComposer,
          $$BarcodeEntitiesTableAnnotationComposer,
          $$BarcodeEntitiesTableCreateCompanionBuilder,
          $$BarcodeEntitiesTableUpdateCompanionBuilder,
          (
            BarcodeEntity,
            BaseReferences<_$AppDatabase, $BarcodeEntitiesTable, BarcodeEntity>,
          ),
          BarcodeEntity,
          PrefetchHooks Function()
        > {
  $$BarcodeEntitiesTableTableManager(
    _$AppDatabase db,
    $BarcodeEntitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BarcodeEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BarcodeEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BarcodeEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> barcode = const Value.absent(),
                Value<String> foodItemId = const Value.absent(),
                Value<DateTime> scannedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BarcodeEntitiesCompanion(
                barcode: barcode,
                foodItemId: foodItemId,
                scannedAt: scannedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String barcode,
                required String foodItemId,
                required DateTime scannedAt,
                Value<int> rowid = const Value.absent(),
              }) => BarcodeEntitiesCompanion.insert(
                barcode: barcode,
                foodItemId: foodItemId,
                scannedAt: scannedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BarcodeEntitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BarcodeEntitiesTable,
      BarcodeEntity,
      $$BarcodeEntitiesTableFilterComposer,
      $$BarcodeEntitiesTableOrderingComposer,
      $$BarcodeEntitiesTableAnnotationComposer,
      $$BarcodeEntitiesTableCreateCompanionBuilder,
      $$BarcodeEntitiesTableUpdateCompanionBuilder,
      (
        BarcodeEntity,
        BaseReferences<_$AppDatabase, $BarcodeEntitiesTable, BarcodeEntity>,
      ),
      BarcodeEntity,
      PrefetchHooks Function()
    >;
typedef $$MealRecordsTableCreateCompanionBuilder =
    MealRecordsCompanion Function({
      required String id,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$MealRecordsTableUpdateCompanionBuilder =
    MealRecordsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<int> rowid,
    });

final class $$MealRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $MealRecordsTable, MealRecord> {
  $$MealRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MealEntriesTable, List<MealEntry>>
  _mealEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealEntries,
    aliasName: $_aliasNameGenerator(
      db.mealRecords.id,
      db.mealEntries.mealRecordId,
    ),
  );

  $$MealEntriesTableProcessedTableManager get mealEntriesRefs {
    final manager = $$MealEntriesTableTableManager(
      $_db,
      $_db.mealEntries,
    ).filter((f) => f.mealRecordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MealRecordsTable> {
  $$MealRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> mealEntriesRefs(
    Expression<bool> Function($$MealEntriesTableFilterComposer f) f,
  ) {
    final $$MealEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.mealRecordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableFilterComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealRecordsTable> {
  $$MealRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MealRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealRecordsTable> {
  $$MealRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  Expression<T> mealEntriesRefs<T extends Object>(
    Expression<T> Function($$MealEntriesTableAnnotationComposer a) f,
  ) {
    final $$MealEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.mealRecordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealRecordsTable,
          MealRecord,
          $$MealRecordsTableFilterComposer,
          $$MealRecordsTableOrderingComposer,
          $$MealRecordsTableAnnotationComposer,
          $$MealRecordsTableCreateCompanionBuilder,
          $$MealRecordsTableUpdateCompanionBuilder,
          (MealRecord, $$MealRecordsTableReferences),
          MealRecord,
          PrefetchHooks Function({bool mealEntriesRefs})
        > {
  $$MealRecordsTableTableManager(_$AppDatabase db, $MealRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealRecordsCompanion(id: id, date: date, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) =>
                  MealRecordsCompanion.insert(id: id, date: date, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (mealEntriesRefs) db.mealEntries],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mealEntriesRefs)
                    await $_getPrefetchedData<
                      MealRecord,
                      $MealRecordsTable,
                      MealEntry
                    >(
                      currentTable: table,
                      referencedTable: $$MealRecordsTableReferences
                          ._mealEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MealRecordsTableReferences(
                            db,
                            table,
                            p0,
                          ).mealEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.mealRecordId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MealRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealRecordsTable,
      MealRecord,
      $$MealRecordsTableFilterComposer,
      $$MealRecordsTableOrderingComposer,
      $$MealRecordsTableAnnotationComposer,
      $$MealRecordsTableCreateCompanionBuilder,
      $$MealRecordsTableUpdateCompanionBuilder,
      (MealRecord, $$MealRecordsTableReferences),
      MealRecord,
      PrefetchHooks Function({bool mealEntriesRefs})
    >;
typedef $$MealEntriesTableCreateCompanionBuilder =
    MealEntriesCompanion Function({
      required String id,
      required String mealRecordId,
      required String mealType,
      required String foodItemId,
      required double quantity,
      required String servingDescription,
      required double servingWeightGrams,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$MealEntriesTableUpdateCompanionBuilder =
    MealEntriesCompanion Function({
      Value<String> id,
      Value<String> mealRecordId,
      Value<String> mealType,
      Value<String> foodItemId,
      Value<double> quantity,
      Value<String> servingDescription,
      Value<double> servingWeightGrams,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$MealEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $MealEntriesTable, MealEntry> {
  $$MealEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MealRecordsTable _mealRecordIdTable(_$AppDatabase db) =>
      db.mealRecords.createAlias(
        $_aliasNameGenerator(db.mealEntries.mealRecordId, db.mealRecords.id),
      );

  $$MealRecordsTableProcessedTableManager get mealRecordId {
    final $_column = $_itemColumn<String>('meal_record_id')!;

    final manager = $$MealRecordsTableTableManager(
      $_db,
      $_db.mealRecords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealRecordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FoodItemsTable _foodItemIdTable(_$AppDatabase db) =>
      db.foodItems.createAlias(
        $_aliasNameGenerator(db.mealEntries.foodItemId, db.foodItems.id),
      );

  $$FoodItemsTableProcessedTableManager get foodItemId {
    final $_column = $_itemColumn<String>('food_item_id')!;

    final manager = $$FoodItemsTableTableManager(
      $_db,
      $_db.foodItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_foodItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get servingDescription => $composableBuilder(
    column: $table.servingDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingWeightGrams => $composableBuilder(
    column: $table.servingWeightGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MealRecordsTableFilterComposer get mealRecordId {
    final $$MealRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealRecordId,
      referencedTable: $db.mealRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealRecordsTableFilterComposer(
            $db: $db,
            $table: $db.mealRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodItemsTableFilterComposer get foodItemId {
    final $$FoodItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodItemId,
      referencedTable: $db.foodItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodItemsTableFilterComposer(
            $db: $db,
            $table: $db.foodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get servingDescription => $composableBuilder(
    column: $table.servingDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingWeightGrams => $composableBuilder(
    column: $table.servingWeightGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealRecordsTableOrderingComposer get mealRecordId {
    final $$MealRecordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealRecordId,
      referencedTable: $db.mealRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealRecordsTableOrderingComposer(
            $db: $db,
            $table: $db.mealRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodItemsTableOrderingComposer get foodItemId {
    final $$FoodItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodItemId,
      referencedTable: $db.foodItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodItemsTableOrderingComposer(
            $db: $db,
            $table: $db.foodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get servingDescription => $composableBuilder(
    column: $table.servingDescription,
    builder: (column) => column,
  );

  GeneratedColumn<double> get servingWeightGrams => $composableBuilder(
    column: $table.servingWeightGrams,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MealRecordsTableAnnotationComposer get mealRecordId {
    final $$MealRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealRecordId,
      referencedTable: $db.mealRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FoodItemsTableAnnotationComposer get foodItemId {
    final $$FoodItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.foodItemId,
      referencedTable: $db.foodItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FoodItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.foodItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealEntriesTable,
          MealEntry,
          $$MealEntriesTableFilterComposer,
          $$MealEntriesTableOrderingComposer,
          $$MealEntriesTableAnnotationComposer,
          $$MealEntriesTableCreateCompanionBuilder,
          $$MealEntriesTableUpdateCompanionBuilder,
          (MealEntry, $$MealEntriesTableReferences),
          MealEntry,
          PrefetchHooks Function({bool mealRecordId, bool foodItemId})
        > {
  $$MealEntriesTableTableManager(_$AppDatabase db, $MealEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mealRecordId = const Value.absent(),
                Value<String> mealType = const Value.absent(),
                Value<String> foodItemId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<String> servingDescription = const Value.absent(),
                Value<double> servingWeightGrams = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealEntriesCompanion(
                id: id,
                mealRecordId: mealRecordId,
                mealType: mealType,
                foodItemId: foodItemId,
                quantity: quantity,
                servingDescription: servingDescription,
                servingWeightGrams: servingWeightGrams,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mealRecordId,
                required String mealType,
                required String foodItemId,
                required double quantity,
                required String servingDescription,
                required double servingWeightGrams,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MealEntriesCompanion.insert(
                id: id,
                mealRecordId: mealRecordId,
                mealType: mealType,
                foodItemId: foodItemId,
                quantity: quantity,
                servingDescription: servingDescription,
                servingWeightGrams: servingWeightGrams,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealRecordId = false, foodItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mealRecordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mealRecordId,
                                referencedTable: $$MealEntriesTableReferences
                                    ._mealRecordIdTable(db),
                                referencedColumn: $$MealEntriesTableReferences
                                    ._mealRecordIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (foodItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.foodItemId,
                                referencedTable: $$MealEntriesTableReferences
                                    ._foodItemIdTable(db),
                                referencedColumn: $$MealEntriesTableReferences
                                    ._foodItemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MealEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealEntriesTable,
      MealEntry,
      $$MealEntriesTableFilterComposer,
      $$MealEntriesTableOrderingComposer,
      $$MealEntriesTableAnnotationComposer,
      $$MealEntriesTableCreateCompanionBuilder,
      $$MealEntriesTableUpdateCompanionBuilder,
      (MealEntry, $$MealEntriesTableReferences),
      MealEntry,
      PrefetchHooks Function({bool mealRecordId, bool foodItemId})
    >;
typedef $$WaterLogsTableCreateCompanionBuilder =
    WaterLogsCompanion Function({
      required String id,
      required int amountMl,
      required DateTime date,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$WaterLogsTableUpdateCompanionBuilder =
    WaterLogsCompanion Function({
      Value<String> id,
      Value<int> amountMl,
      Value<DateTime> date,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$WaterLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMl => $composableBuilder(
    column: $table.amountMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WaterLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMl => $composableBuilder(
    column: $table.amountMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WaterLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountMl =>
      $composableBuilder(column: $table.amountMl, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WaterLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WaterLogsTable,
          WaterLog,
          $$WaterLogsTableFilterComposer,
          $$WaterLogsTableOrderingComposer,
          $$WaterLogsTableAnnotationComposer,
          $$WaterLogsTableCreateCompanionBuilder,
          $$WaterLogsTableUpdateCompanionBuilder,
          (WaterLog, BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLog>),
          WaterLog,
          PrefetchHooks Function()
        > {
  $$WaterLogsTableTableManager(_$AppDatabase db, $WaterLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaterLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaterLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaterLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> amountMl = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WaterLogsCompanion(
                id: id,
                amountMl: amountMl,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int amountMl,
                required DateTime date,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => WaterLogsCompanion.insert(
                id: id,
                amountMl: amountMl,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WaterLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WaterLogsTable,
      WaterLog,
      $$WaterLogsTableFilterComposer,
      $$WaterLogsTableOrderingComposer,
      $$WaterLogsTableAnnotationComposer,
      $$WaterLogsTableCreateCompanionBuilder,
      $$WaterLogsTableUpdateCompanionBuilder,
      (WaterLog, BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLog>),
      WaterLog,
      PrefetchHooks Function()
    >;
typedef $$WeightLogsTableCreateCompanionBuilder =
    WeightLogsCompanion Function({
      required String id,
      required double weightKg,
      required DateTime date,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$WeightLogsTableUpdateCompanionBuilder =
    WeightLogsCompanion Function({
      Value<String> id,
      Value<double> weightKg,
      Value<DateTime> date,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$WeightLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WeightLogsTable> {
  $$WeightLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeightLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightLogsTable> {
  $$WeightLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeightLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightLogsTable> {
  $$WeightLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$WeightLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeightLogsTable,
          WeightLog,
          $$WeightLogsTableFilterComposer,
          $$WeightLogsTableOrderingComposer,
          $$WeightLogsTableAnnotationComposer,
          $$WeightLogsTableCreateCompanionBuilder,
          $$WeightLogsTableUpdateCompanionBuilder,
          (
            WeightLog,
            BaseReferences<_$AppDatabase, $WeightLogsTable, WeightLog>,
          ),
          WeightLog,
          PrefetchHooks Function()
        > {
  $$WeightLogsTableTableManager(_$AppDatabase db, $WeightLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeightLogsCompanion(
                id: id,
                weightKg: weightKg,
                date: date,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double weightKg,
                required DateTime date,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeightLogsCompanion.insert(
                id: id,
                weightKg: weightKg,
                date: date,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeightLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeightLogsTable,
      WeightLog,
      $$WeightLogsTableFilterComposer,
      $$WeightLogsTableOrderingComposer,
      $$WeightLogsTableAnnotationComposer,
      $$WeightLogsTableCreateCompanionBuilder,
      $$WeightLogsTableUpdateCompanionBuilder,
      (WeightLog, BaseReferences<_$AppDatabase, $WeightLogsTable, WeightLog>),
      WeightLog,
      PrefetchHooks Function()
    >;
typedef $$RecentFoodsByMealTableCreateCompanionBuilder =
    RecentFoodsByMealCompanion Function({
      required String foodItemId,
      required String mealType,
      required DateTime lastUsedAt,
      Value<int> useCount,
      Value<int> rowid,
    });
typedef $$RecentFoodsByMealTableUpdateCompanionBuilder =
    RecentFoodsByMealCompanion Function({
      Value<String> foodItemId,
      Value<String> mealType,
      Value<DateTime> lastUsedAt,
      Value<int> useCount,
      Value<int> rowid,
    });

class $$RecentFoodsByMealTableFilterComposer
    extends Composer<_$AppDatabase, $RecentFoodsByMealTable> {
  $$RecentFoodsByMealTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get foodItemId => $composableBuilder(
    column: $table.foodItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get useCount => $composableBuilder(
    column: $table.useCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecentFoodsByMealTableOrderingComposer
    extends Composer<_$AppDatabase, $RecentFoodsByMealTable> {
  $$RecentFoodsByMealTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get foodItemId => $composableBuilder(
    column: $table.foodItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get useCount => $composableBuilder(
    column: $table.useCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecentFoodsByMealTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecentFoodsByMealTable> {
  $$RecentFoodsByMealTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get foodItemId => $composableBuilder(
    column: $table.foodItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get useCount =>
      $composableBuilder(column: $table.useCount, builder: (column) => column);
}

class $$RecentFoodsByMealTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecentFoodsByMealTable,
          RecentFoodsByMealData,
          $$RecentFoodsByMealTableFilterComposer,
          $$RecentFoodsByMealTableOrderingComposer,
          $$RecentFoodsByMealTableAnnotationComposer,
          $$RecentFoodsByMealTableCreateCompanionBuilder,
          $$RecentFoodsByMealTableUpdateCompanionBuilder,
          (
            RecentFoodsByMealData,
            BaseReferences<
              _$AppDatabase,
              $RecentFoodsByMealTable,
              RecentFoodsByMealData
            >,
          ),
          RecentFoodsByMealData,
          PrefetchHooks Function()
        > {
  $$RecentFoodsByMealTableTableManager(
    _$AppDatabase db,
    $RecentFoodsByMealTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecentFoodsByMealTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecentFoodsByMealTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecentFoodsByMealTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> foodItemId = const Value.absent(),
                Value<String> mealType = const Value.absent(),
                Value<DateTime> lastUsedAt = const Value.absent(),
                Value<int> useCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecentFoodsByMealCompanion(
                foodItemId: foodItemId,
                mealType: mealType,
                lastUsedAt: lastUsedAt,
                useCount: useCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String foodItemId,
                required String mealType,
                required DateTime lastUsedAt,
                Value<int> useCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecentFoodsByMealCompanion.insert(
                foodItemId: foodItemId,
                mealType: mealType,
                lastUsedAt: lastUsedAt,
                useCount: useCount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecentFoodsByMealTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecentFoodsByMealTable,
      RecentFoodsByMealData,
      $$RecentFoodsByMealTableFilterComposer,
      $$RecentFoodsByMealTableOrderingComposer,
      $$RecentFoodsByMealTableAnnotationComposer,
      $$RecentFoodsByMealTableCreateCompanionBuilder,
      $$RecentFoodsByMealTableUpdateCompanionBuilder,
      (
        RecentFoodsByMealData,
        BaseReferences<
          _$AppDatabase,
          $RecentFoodsByMealTable,
          RecentFoodsByMealData
        >,
      ),
      RecentFoodsByMealData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FoodItemsTableTableManager get foodItems =>
      $$FoodItemsTableTableManager(_db, _db.foodItems);
  $$ServingSizesTableTableManager get servingSizes =>
      $$ServingSizesTableTableManager(_db, _db.servingSizes);
  $$BarcodeEntitiesTableTableManager get barcodeEntities =>
      $$BarcodeEntitiesTableTableManager(_db, _db.barcodeEntities);
  $$MealRecordsTableTableManager get mealRecords =>
      $$MealRecordsTableTableManager(_db, _db.mealRecords);
  $$MealEntriesTableTableManager get mealEntries =>
      $$MealEntriesTableTableManager(_db, _db.mealEntries);
  $$WaterLogsTableTableManager get waterLogs =>
      $$WaterLogsTableTableManager(_db, _db.waterLogs);
  $$WeightLogsTableTableManager get weightLogs =>
      $$WeightLogsTableTableManager(_db, _db.weightLogs);
  $$RecentFoodsByMealTableTableManager get recentFoodsByMeal =>
      $$RecentFoodsByMealTableTableManager(_db, _db.recentFoodsByMeal);
}
