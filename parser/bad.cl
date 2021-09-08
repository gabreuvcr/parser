
(*
 *  execute "coolc bad.cl" to see the error messages that the coolc parser
 *  generates
 *
 *  execute "myparser bad.cl" to see the error messages that your parser
 *  generates
 *)

(* no error *)
class A {
};

(* error:  b is not a type identifier *)
Class b inherits A {
};

(* error:  a is not a type identifier *)
Class C inherits a {
};

(* error:  keyword inherits is misspelled *)
Class D inherts A {
};

(* error:  closing brace is missing *)
Class E inherits A {
;

(* error:  opening brace is missing *)
Class E2 inherits A 
};

(* Outros erros*)
class F {
    (* Erros em declarações em expressão let *)
    test_F1() : Object {
        let a: Int <- b, b: Int $ 10 c: Bool <- true in {
            out_string(b);
        }
    };

    (* Erros em features *)
    x Int;
    y: Int
    z: Int
    w: Int;
    t:: Int;

    (*Erros em blocos de expressão *)
    test_F2(): Object {{
        if 23 = 10 then 
            out_string("1 if\n")
        el
            out_string("1 else\n")
        fi;

        let a: Int in {
            a <- 0;
            while a < 4 loop
                a <- a + 1
            pol;
        };
    }};
};

(* Classe sem ponto-vírgula no final *)
class G {

}
