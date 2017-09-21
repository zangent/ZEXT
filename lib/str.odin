export "core:strings.odin";

cat :: proc(strs: ...string) -> string {
	total := 0;
	for s in strs do total += len(s);
	out := make([]u8, total);
	i := 0;
	for s in strs {
		for j in 0..len(s) {
			out[i] = s[j];
			i+=1;
		}
	}
	return string(out);
}

// Does the first string start with the second one?
starts_with :: proc(haystack, needle: string) -> bool #inline {
	if len(haystack) < len(needle) do return false;
	for i in 0..len(needle) do if needle[i] != haystack[i] do return false;
	return true;
}
// Does the first string end with the second one?
ends_with :: proc(haystack, needle: string) -> bool #inline {
	if len(haystack) < len(needle) do return false;
	hl, nl := len(haystack)-1, len(needle)-1;
	for i in 0..len(needle) do if needle[nl-i] != haystack[hl-i] do return false;
	return true;
}

dup :: proc(s: string) -> string {
	c := make([]u8, len(s));
	copy(c, cast([]u8)s);
	return string(c);
}

is_whitespace :: proc(char: rune) -> bool #inline do return char == ' ' || char == '\t' || char == '\r' || char == '\n';

is_whitespace :: proc(char: u8) -> bool #inline do return is_whitespace(cast(rune)char);


trim :: proc(s: string) -> string {
	b := 0;
	for i := 0; i < len(s); i += 1 {
		if !is_whitespace(s[i]) {
			b = i;
			break;
		}
	}
	for i := len(s)-1; i > 0; i -= 1 {
		if !is_whitespace(s[i]) {
			return s[b..i+1];
		}
	}
	return s;
}