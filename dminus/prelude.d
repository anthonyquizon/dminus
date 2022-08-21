module dminus.prelude;

import core.stdc.stdlib : atoi;
import core.stdc.stdio : sprintf;
import core.bitop;
import core.stdc.string : strlen, memcmp;
import core.stdc.stddef : wchar_t;
import C=core.stdc.stdio;
import core.stdc.stdlib, core.sys.posix.unistd;

public import core.stdc.stdio : FILE;

alias つ = string, し = size_t, ひ=double, ろ=bool, ʘ=void, の=char, ㄅ=ubyte, ㄋㄙ=uint, ㄙ=int, 〆=ulong, て=float;

enum ろ Isδ(T)  = is(typeof(T.init.length));
enum ろ Isつ(T) = is(typeof(T.toString));
enum ろ Isφ(T)  = __traits(isAssociativeArray, T);
enum ろ Isて(T) = __traits(isFloating, T) && is(T : real);
enum ろ IsFn(alias T) = is(typeof(T) == delegate) || is(T == delegate) || is(typeof(*T) == function);

enum ろ Hasつ(T) = is(typeof(T.opづ));
enum ろ Has०(T) = is(typeof(T.op०));
enum ろ Has叵(T) = is(typeof(T.op叵));

mixin template opBi(
    A, つ[] f0
) {
    static foreach (k; f0) { A opBinary(つ op: k)(A r) { return _opBi!(k)(this, r); } }
}

mixin template opBi(
    A, つ[] f0,
    B, つ[] f1
) {
    static foreach (k; f0) { A opBinary(つ op: k)(A r) { return _opBi!(k)(this, r); } }
    static foreach (k; f1) { A opBinary(つ op: k)(B r) { return _opBi!(k)(this, r); } }
}

mixin template opBi(
    A, つ[] f0,
    B, つ[] f1,
    C, つ[] f2
) {
    static foreach (k; f0) { A opBinary(つ op: k)(A r) { return _opBi!(k)(this, r); } }
    static foreach (k; f1) { A opBinary(つ op: k)(B r) { return _opBi!(k)(this, r); } }
    static foreach (k; f2) { A opBinary(つ op: k)(C r) { return _opBi!(k)(this, r); } }
}

mixin template opBi(
    A, つ f0 = [], 
    B, つ f1 = [],
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return _opBi!f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return _opBi!f(this, r); } }
}

mixin template opBi(
    A, つ f0 = [], 
    B, つ f1 = [],
    C, つ f2 = [],
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return _opBi!f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return _opBi!f(this, r); } }
    static foreach (k, f; f2) { A opBinary(つ op: k)(C r) { return _opBi!f(this, r); } }
}

mixin template opBi(
    A, alias f0
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return f(this, r); } }
}

mixin template opBi(
    A, alias f0 = [], 
    B, alias f1 = [],
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return f(this, r); } }
}

mixin template opBi(
    A, alias f0 = [], 
    B, alias f1 = [],
    C, alias f2 = []
) {
    static foreach (k, f; f0) { A opBinary(つ op: k)(A r) { return f(this, r); } }
    static foreach (k, f; f1) { A opBinary(つ op: k)(B r) { return f(this, r); } }
    static foreach (k, f; f2) { A opBinary(つ op: k)(C r) { return f(this, r); } }
}

mixin template opBiR(
    A, 
    B, alias f1 = [],
) {
    static foreach (k, f; f1) { B opBinaryRight(つ op: k)(B l) { return f(l, this); } }
}

mixin template opBiR(
    A, 
    B, alias f1 = [],
    C, alias f2 = []
) {
    static foreach (k, f; f1) { B opBinaryRight(つ op: k)(B l) { return f(l, this); } }
    static foreach (k, f; f2) { C opBinaryRight(つ op: k)(B l) { return f(l, this); } }
}

//! Tuples
struct ㄇ(A, B) { A a; B b; }
struct ㄇ(A, B, C) { A a; B b; C c; }
struct ㄇ(A, B, C, D) { A a; B b; C c; D d; }
struct ㄇ(A, B, C, D, E) { A a; B b; C c; D d; E e; }
struct ㄇ(A, B, C, D, E, F) { A a; B b; C c; D d; E e; F f; }

ㄇ!(A, B, C) ୦(A, B, C)(A a, B b, C c) { return ㄇ!(A, B, C)(a, b, c); }
ㄇ!(A, B, C, D) ୦(A, B, C, D)(A a, B b, C c, D d) { return ㄇ!(A, B, C, D)(a, b, c, d); }
ㄇ!(A, B, C, D, E) ୦(A, B, C, D, E)(A a, B b, C c, D d, E e) { return ㄇ!(A, B, C, D, E)(a, b, c, d, e); }
ㄇ!(A, B, C, D, E, F) ୦(A, B, C, D, E, F)(A a, B b, C c, D d, E e, F f) { return ㄇ!(A, B, C, D, E, F)(a, b, c, d, e, f); }
