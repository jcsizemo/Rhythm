module NameMap = Map.Make(struct
  type t = string
  let compare x y = Pervasives.compare x y
end)

module IntMap = Map.Make(struct
  type t = int
  let compare x y = Pervasives.compare x y
end)

let maxNoteInt = 127;;
let minNoteInt = 0;;

let noteToIntMap = NameMap.empty;;
let noteToIntMap = NameMap.add "A" 0 noteToIntMap;;  
let noteToIntMap = NameMap.add "A#" 1 noteToIntMap;; 
let noteToIntMap = NameMap.add "Bb" 1 noteToIntMap;; 
let noteToIntMap = NameMap.add "B" 2 noteToIntMap;; 
let noteToIntMap = NameMap.add "Cb" 2 noteToIntMap;; 
let noteToIntMap = NameMap.add "B#" 3 noteToIntMap;; 
let noteToIntMap = NameMap.add "C" 3 noteToIntMap;; 
let noteToIntMap = NameMap.add "C#" 4 noteToIntMap;; 
let noteToIntMap = NameMap.add "Db" 4 noteToIntMap;; 
let noteToIntMap = NameMap.add "D" 5 noteToIntMap;; 
let noteToIntMap = NameMap.add "D#" 6 noteToIntMap;; 
let noteToIntMap = NameMap.add "Eb" 6 noteToIntMap;; 
let noteToIntMap = NameMap.add "E" 7 noteToIntMap;; 
let noteToIntMap = NameMap.add "Fb" 7 noteToIntMap;;
let noteToIntMap = NameMap.add "E#" 8 noteToIntMap;; 
let noteToIntMap = NameMap.add "F" 8 noteToIntMap;; 
let noteToIntMap = NameMap.add "F#" 9 noteToIntMap;; 
let noteToIntMap = NameMap.add "Gb" 9 noteToIntMap;; 
let noteToIntMap = NameMap.add "G" 10 noteToIntMap;; 
let noteToIntMap = NameMap.add "G#" 11 noteToIntMap;; 

let intToNoteMap = IntMap.empty;;
let intToNoteMap = IntMap.add 0 "A" intToNoteMap;;  
let intToNoteMap = IntMap.add 1 "A#" intToNoteMap;; 
let intToNoteMap = IntMap.add 2 "B" intToNoteMap;; 
let intToNoteMap = IntMap.add 3 "C" intToNoteMap;; 
let intToNoteMap = IntMap.add 4 "C#" intToNoteMap;; 
let intToNoteMap = IntMap.add 5 "D" intToNoteMap;; 
let intToNoteMap = IntMap.add 6 "D#" intToNoteMap;; 
let intToNoteMap = IntMap.add 7 "E" intToNoteMap;; 
let intToNoteMap = IntMap.add 8 "F" intToNoteMap;; 
let intToNoteMap = IntMap.add 9 "F#" intToNoteMap;; 
let intToNoteMap = IntMap.add 10 "G" intToNoteMap;; 
let intToNoteMap = IntMap.add 11 "G#" intToNoteMap;; 

let noteToInt = fun x ->
	let octave = String.get x ((String.length x)-1) in
		let basicNote = String.sub x 0 ((String.length x)-1) in 
			((NameMap.find basicNote noteToIntMap) + ((int_of_char octave)-48) * 12)
let intToNote = fun x -> 
	let rec intToNoteRecursive = fun x y ->
		if x > 11 
			then intToNoteRecursive (x-12) (y+1) 
			else (IntMap.find x intToNoteMap) ^ string_of_int x
	in intToNoteRecursive x 0

let noteToDuration = fun x ->
		if String.contains x '.' then 
			 int_of_string(String.sub x ((String.index x '.')+1) ((String.length x) - ((String.index x '.')+1)))
		else 4

let extractNoteWithoutDuration = fun x ->
		if String.contains x '.' then 
			 String.sub x 0 (String.index x '.') 
		else x

let setNoteDuration = fun x y ->
		(extractNoteWithoutDuration x) ^ "." ^ (string_of_int y)

