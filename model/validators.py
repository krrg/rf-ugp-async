
class ValidationException(RuntimeError):
    pass


"""
Allows a custom validation function to passed in.  The function ought to return
a truthy value OR a (falsey value, error message) tuple if the key, value pair
does not pass validation.
"""
def validate_with(actual_attrs, fn_validator):
    for key, value in actual_attrs.iteritems():
        # call the custom function
        validation_result = fn_validator(key, value)

        # if the first return value is falsey, raise the second
        #  returned value as an error message.
        if not validation_result[0]:
            raise ValidationException(validation_result[1])


"""
** This is a wrapper method! **

Asserts that certain keys are present and (optionally) maps to a non-null value.
Throws a ValidationException otherwise.
"""
def requires_presence_of(required_attrs, allow_nulls=False):
    def wrapper(model_func):
        def requires_presence_of_and_call(*args, **kwargs):
            for required in required_attrs:
                if allow_nulls and required not in kwargs:
                    raise ValidationException("Missing required attribute {}".format(required))
                if kwargs.get(required) is None:
                    raise ValidationException("Missing required non-null attribute {}".format(required))
            return model_func(*args, **kwargs)
        return requires_presence_of_and_call
    return wrapper

"""
** This is a wrapper method! **

Throws a ValidationException if any unrecognized attributes are present
in the actual_attrs
"""
def limit_to(allowed_attrs):

    def filter_function(k, v):
        return k in allowed_attrs or k == 'connection', 'Sorry `{}` is not allowed'.format(k)

    def wrapper(model_func):
        def limit_to_and_call(*args, **kwargs):
            validate_with(kwargs, filter_function)
            # If it made it to here, it implies that no exception was raised.
            return model_func(*args, **kwargs)
        return limit_to_and_call
    return wrapper


"""
** This is a wrapper method! **

Is equivalent to marking a method with
@limit_to and @requires_presence_of
"""
def requires_exactly(allowed_attrs):
    def wrapper(func):
        @limit_to(allowed_attrs)
        @requires_presence_of(allowed_attrs)
        def annotated_call(*args, **kwargs):
            return func(*args, **kwargs)
        return annotated_call
    return wrapper


"""
** This is a wrapper method! **

Requires that a certain attribute, if present, have a value in the given list.
"""
def requires_attribute_value_of(attribute, allowed_values):
    def wrapper(func):
        def enforce_and_call(*args, **kwargs):
            if attribute in kwargs and kwargs[attribute] not in allowed_values:
                raise ValidationException("Value for {} must be one of {}".format(attribute, allowed_values))
            else:
                return func(*args, **kwargs)
        return enforce_and_call
    return wrapper
