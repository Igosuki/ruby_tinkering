use std::ops::Range;

fn capitalize(s: &str) -> String {
    let mut c = s.chars();
    (c.next().unwrap().to_uppercase().collect::<String>() + c.as_str()).to_string()
}

fn bottle_verse(n: i32) -> String {
    match n {
        0 => "no more bottles of beer".to_string(),
        1 => "1 bottle of beer".to_string(),
        -1 => "99 bottles of beer".to_string(),
        x => format!("{} bottles of beer", x)
    }
}

pub fn verse(n: i32) -> String {
    let instruction = match n {
        0 => "Go to the store and buy some more",
        1 => "Take it down and pass it around",
        _ => "Take one down and pass it around"
    };
    let current_verse = bottle_verse(n);
    let next_verse = bottle_verse(n -1);
    format!("{} on the wall, {}.\n{}, {} on the wall.\n", capitalize(&current_verse), current_verse, instruction, next_verse)
}

pub fn sing(start: u32, end: u32) -> String {
    let verses: Vec<String> = if start > end {
        (end..start + 1).rev().map(|nth| verse(nth as i32)).collect()
    } else {
        (start..end).map(|nth| verse(nth as i32)).collect()
    };
    verses.join("\n")
}
