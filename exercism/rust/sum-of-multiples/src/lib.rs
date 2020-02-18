pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    if factors.len() == 0 {
        return 0;
    }
    let min = factors.iter().min().unwrap();
    (*min..limit).filter(move |n| factors.iter().filter(|n| **n > 0).any(|f| n % f  == 0)).sum()
}
