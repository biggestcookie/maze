class_name EnumUtils

static func get_enum_name(enum_value: Variant, enum_dict: Dictionary) -> String:
	return enum_dict.find_key(enum_value)
