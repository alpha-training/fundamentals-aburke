\d .event			/ we are going to put our code in the .event namespace

handlers:(0#`)!()		/ dictionary of event names to handlers

/ addHandler is used to add a handler for an event
/ if it's the first handler for this event (i.e. 0=handlers event, you need to define that event)
/ e.g. if .event.addHandler[`.z.pc;`someFunc] is called, and `.z.pc is not a key in the handlers dictionary, you will need to define .z.pc. However if it is defined, you don't need to re-define it
/ To do this, use the phrase event set fire event
addHandler:{[event;handler] ... }

/ next is to write the fire function
/ event is the event name e.g. `.z.pc
/ arg is the argument (e.g. .z.pc always takes a handle)
fire:{[event;arg] ... }		

\d .

//
// sample from video
A:10


add:{doubleA:A*2;x+y}





