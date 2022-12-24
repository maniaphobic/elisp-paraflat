# Flatten paragraphs by replacing newlines with spaces

This Emacs Lisp library "flattens" text in a buffer by joining a
paragraph's lines with spaces instead of newlines. It considers
paragraphs to be text delimited by two or more consecutive newlines.

For example, it would transform this text:

    The Deliverator belongs to an elite order, a hallowed
    sub-category. He's got esprit up to here. Right now he is preparing to
    carry out his third mission of the night. His uniform is black as
    activated charcoal, filtering the very light out of the air. A bullet
    will bounce off its arachno-fiber weave like a wren hitting a patio
    door, but excess perspiration wafts through it like a breeze through a
    freshly napalmed forest. Where his body has bony extremities, the suit
    has sintered armorgel: feels like gritty jello, protects like a stack
    of telephone books.
    
    When they gave him the job, they gave him a gun. The Deliverator never
    deals in cash, but someone might come after him anyway–might want his
    car, or his cargo. The gun is a tiny, aero-styled, lightweight, the
    kind of a gun a fashion designer would carry; it fires teensy darts
    that fly at five times the velocity of an SR-71 spy plane, and when
    you get done using it, you have to plug it in to the cigarette
    lighter, because it runs on electricity.

... to this:

    The Deliverator belongs to an elite order, a hallowed sub-category. He's got esprit up to here. Right now he is preparing to carry out his third mission of the night. His uniform is black as activated charcoal, filtering the very light out of the air. A bullet will bounce off its arachno-fiber weave like a wren hitting a patio door, but excess perspiration wafts through it like a breeze through a freshly napalmed forest. Where his body has bony extremities, the suit has sintered armorgel: feels like gritty jello, protects like a stack of telephone books.

    When they gave him the job, they gave him a gun. The Deliverator never deals in cash, but someone might come after him anyway–might want his car, or his cargo. The gun is a tiny, aero-styled, lightweight, the kind of a gun a fashion designer would carry; it fires teensy darts that fly at five times the velocity of an SR-71 spy plane, and when you get done using it, you have to plug it in to the cigarette lighter, because it runs on electricity. 

This is useful for composing a message in an Emacs buffer and
reformatting the paragraphs without line breaks before pasting into an
HTML form.

## Usage

Position point at the beginning of a block of text you want to
transform, then invoke `pf/flatten-paragraphs`. By default, it
flattens every paragraph between point and the end of the buffer.
