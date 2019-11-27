use rayon::prelude::*;

fn square(i: u32) -> u32 {
    i * i
}

pub fn square_of_sum(n: u32) -> u32 {
//    square((0..=n).into_par_iter().reduce(|| 0, |r, num| r + num))
    square(n * (n + 1) /2)
}

pub fn sum_of_squares(n: u32) -> u32 {
//    (0..=n).into_par_iter().reduce(|| 0, |r, num| r + square(num))
    n * (n + 1) * (2*n + 1) / 6
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
