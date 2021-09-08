class A {
    x: Int;
    y : Bool;
    z : String;

    initA(x_ : Int, y_: Bool, z_: String) : A {
        {
            x <- x_;
            y <- y_;
            z <- z_;
            self;
        }
    };

    getX(): Int {
        x
    };

    getY(): Bool {
        y
    };

    getZ(): String {
        z
    };
};

Class B inherits A {
    w: Int;
    initB(x_ : Int, y_: Bool, z_: String, w_: Int) : B {
        {   
            initA(x_, y_, z_);
            w <- w_;
            self;
        }
    };
    
    getX(): Int {
        self@A.getX()
    };
};

class Main inherits IO {
    test_if_function(test_A: A): Bool {{
        out_string("    ");
        if test_A.getX() = 10 then 
            out_string("1 if\n")
        else
            out_string("1 else\n")
        fi;

        out_string("    ");
        if test_A.getY() = false then
            out_string("2 if\n")
        else
            out_string("2 else\n")
        fi;

        if test_A.getZ() = "Banana" then true else false fi;
    }};

    test_while_function(num: Int): Int {{
        while num < 10 loop {
            out_int(num);
            out_string(" ");
            num <- num + 1;
        }
        pool;
        num;
    }};

    test_expressions_function(): Object {{
        out_string("test expr + expr: \n");
        out_string("    ").out_int(8 + 16);
        out_string("\ntest expr - expr: \n");
        out_string("    ").out_int(32 - 16);
        out_string("\ntest expr * expr: \n");
        out_string("    ").out_int(2 * 32);
        out_string("\ntest expr / expr: \n");
        out_string("    ").out_int(64 / 16);
        out_string("\ntest ~expr: \n");
        out_string("    ").out_int(~128);
        out_string("\ntest expr < expr: \n");
        out_string("    ").out_bool(128 < 64);
        out_string("\n    ").out_bool(64 < 128);
        out_string("\ntest expr <= expr: \n");
        out_string("    ").out_bool(128 < 64);
        out_string("\n    ").out_bool(64 <= 128);
        out_string("\n    ").out_bool(64 <= 64);
        out_string("\ntest expr = expr: \n");
        out_string("    ").out_bool(64 = 64);
        out_string("\n    ").out_bool(64 = 32);
        out_string("\ntest not expr: \n");
        out_string("    ").out_bool(not 64 < 128);
        out_string("\n    ").out_bool(not 64 < 32);
        out_string("\n    ").out_bool(not 64 = 64);
        out_string("\n");
    }};

    out_bool(b: Bool): Object {
        if b then out_string("true") else out_string("false") fi
    };

    main(): Object {
        let test_A: A <- (new A).initA(10, true, "Banana"), test_B: B <- (new B).initB(11, false, "Apple", 9) in {
                out_string("test_case:\n");
                out_string("    ");
                case test_A of 
                    dummy: A => out_string("class A\n");
                    dummy: B => out_string("class B\n");
                esac;
                out_string("    ");
                case test_B of 
                    dummy: A => out_string("class A\n");
                    dummy: B => out_string("class B\n");
                esac;

                out_string("test @:\n");
                out_string("    ").out_int(test_B.getX()).out_string("\n");

                out_string("test_if_function:\n");
                let return_test_if: Bool <- test_if_function(test_A) in {
                    out_string("    ");
                    out_bool(return_test_if);
                    out_string("\n");
                };

                out_string("test_while_function:\n");
                out_string("    ");
                let return_test_while: Int <- test_while_function(~5) in {
                    out_int(return_test_while).out_string("\n");
                };


                out_string("test_isvoid:\n");
                let test_isvoid: Object in {
                    out_string("    uninitialized variable: ");
                    out_bool(isvoid test_isvoid);
                };
                out_string("\n");
                let test_isvoid: Int <- 10 in {
                    out_string("    initialized variable: ");
                    out_bool(isvoid test_isvoid);
                };
                out_string("\n");

                test_expressions_function();
        }
    };
};
