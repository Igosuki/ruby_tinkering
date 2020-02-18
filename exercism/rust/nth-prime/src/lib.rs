extern crate rand;

fn is_prime(n: u32) -> bool {
    let up = (n as f32).sqrt();
    ! (2..((up + 1.0) as u32)).any(|i| n % i == 0)
}

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
    (2..).filter(|nth| is_prime(*nth)).nth(n as usize).unwrap()
}
