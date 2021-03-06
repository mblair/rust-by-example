use std::fmt;

struct List(Vec<i32>);

impl fmt::Display for List {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let List(ref vec) = *self;

        try!(write!(f, "["));

        // Iterate over `vec` in `v` while enumerating the iteration
        // count in `count`.
        for (count, v) in vec.iter().enumerate() {
            // For every element except the first, add a comma
            // before calling `write!`. Use `try!` to return on errors.
            if count != 0 {
                try!(write!(f, ", "));
            }
            try!(write!(f, "{}", v));
        }

        write!(f, "]")
    }
}

fn main() {
    let v = List(vec![1, 2, 3]);
    println!("{}", v);
}
