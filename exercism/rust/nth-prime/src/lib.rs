extern crate rand;

use rand::Rng;

const k : i8 = 5;

pub fn nth(n: u32) -> u32 {
    if n == 0 {
        return 2;
    }
    if n == 1 {
        return 3
    }
    if n == 2 {
        return 5
    }
    let n_usize = n as usize;
    let mut rng = rand::thread_rng();
    let mut primes = Vec::with_capacity(n_usize);
    let mut primes_found : usize = 0;
    let mut i = 1;

    while primes_found <= n_usize {
        if (0..=k).fold(false, |r, _| {
            let random_number = rng.gen_range(2, n - 2);
            return r || (gcd(i, random_number) != 1 || random_number.pow(i - 1) % i != 1);
        }) {
            primes.push(i);
            primes_found += 1;
        };
        i += 1;
    }
    primes[n_usize - 1]
}

fn gcd(a : u32, b : u32) -> u32 {
    if a < b {
        return gcd(b, a)
    } else if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}
