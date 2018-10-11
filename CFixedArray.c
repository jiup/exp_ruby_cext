#include "ruby.h"
#include "extconf.h"


VALUE CFixedArray = Qnil;

int *ARRAY, len;
void Init_CFixedArray();
VALUE rb_method_new(int argc, VALUE* argv, VALUE self);
VALUE rb_method_length(VALUE self);
VALUE rb_method_set(VALUE self, VALUE idx, VALUE val);
VALUE rb_method_each(VALUE self);
VALUE rb_method_sum();


void Init_CFixedArray()
{
    CFixedArray = rb_define_module("CFixedArray");
    rb_define_method(CFixedArray, "new", rb_method_new, -1);
    rb_define_method(CFixedArray, "length", rb_method_length, 0);
    rb_define_method(CFixedArray, "set", rb_method_set, 2);
    rb_define_method(CFixedArray, "each", rb_method_each, 0);
    rb_define_method(CFixedArray, "sum", rb_method_sum, 0);
}

VALUE rb_method_new(int argc, VALUE* argv, VALUE self)
{
    if (argc != 1 && argc != 2) {
        rb_raise(rb_eArgError, "wrong number of arguments");
    }

    len = NUM2INT(argv[0]);
    ARRAY = malloc(len * sizeof(int));

    if (argc == 1) {
        memset(ARRAY, 0, len * sizeof(int));
    } else {
        int val = NUM2INT(argv[1]);
        for (int i = 0; i < len; i++) {
            ARRAY[i] = val;
        }
    }

    return self;
}

VALUE rb_method_length(VALUE self)
{
    return INT2NUM(len);
}

VALUE rb_method_set(VALUE self, VALUE idx, VALUE val)
{
    int i = NUM2INT(idx);
    if (i > len) {
        rb_raise(rb_eIndexError, "index out of bound");
    }

    ARRAY[i] = NUM2INT(val);
    return self;
}

VALUE rb_method_each(VALUE self)
{
    if (!rb_block_given_p()) {
        rb_raise(rb_eArgError, "a block is required");
    }

    for (int i = 0; i < len; i++) {
        rb_yield(INT2NUM(ARRAY[i]));
    }

    return Qnil;
}

VALUE rb_method_sum()
{
    long long sum = 0;
    for (int i = 0; i < len; i++) {
        sum += ARRAY[i];
    }
    return LL2NUM(sum);
}