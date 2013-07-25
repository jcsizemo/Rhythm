old  new	
...	...	@@ -0,0 +1,196 @@
	1	+/**
	2	+ * CSV2MIDI.java
	3	+ * June 11, 2003
	4	+ * @author: Stephen Steffes
	5	+ * Purpose:  Converts a .csv file to a MIDI file according to ExampleMIDI.csv
	6	+ */
	7	+
	8	+
	9	+import java.io.*;
	10	+import javax.sound.midi.*;
	11	+import java.lang.*;
	12	+
	13	+
	14	+public class CSV2MIDI{
	15	+
	16	+  public static void main(String[] args)	throws InvalidMidiDataException {
	17	+
	18	+		//***** Get Inputs *****
	19	+		if (args.length != 2)
	20	+			printUsageAndExit();
	21	+	
	22	+		File outputFile = new File(args[1]);
	23	+		Sequence sequence = null;
	24	+
	25	+		//Open and save the CSV file
	26	+		CSV csvFile=new CSV(args[0]);
	27	+		csvFile.fillVector();
	28	+
	29	+
	30	+		//figure out how many channels there are
	31	+		//nChannels=number of integers in the first line containing any numbers, skipping the first number encountered
	32	+		int nChannels=0,temp=0;
	33	+		for(int i=0;i<csvFile.data.size();i++){
	34	+			try{																																//check if this is an integer
	35	+				Integer.parseInt(csvFile.data.elementAt(i).toString());
	36	+				temp++;																														//counts number of instruments
	37	+			}catch(NumberFormatException e){																		//not a number
	38	+				if(temp>1){																												//if other than first number
	39	+					if(csvFile.data.elementAt(i).toString().compareTo("\n")==0){		//if a new line
	40	+						nChannels=temp-1;
	41	+						break;																												//found nChannels, so stop for loop.  this is the number of instruments counted
	42	+					}
	43	+				}
	44	+			}
	45	+		}
	46	+
	47	+
	48	+/*		for(int i=0;i<csvFile.data.size();i++)
	49	+			System.out.println(csvFile.data.elementAt(i));
	50	+*/
	51	+
	52	+
	53	+		//***** Read in timing resolution and instruments *****
	54	+		int currentCSVPos=0, timingRes=1, instrument[]=new int[nChannels];
	55	+
	56	+		//read in timing resolution
	57	+		for(;currentCSVPos<csvFile.data.size();currentCSVPos++)
	58	+			try{																																//check if this is an integer
	59	+				timingRes=Integer.parseInt(csvFile.data.elementAt(currentCSVPos).toString()); //this is the first number, therefore, it's the timing resolution
	60	+				System.out.println("\nTiming Resolution set to "+timingRes+" PPQ\n");  
	61	+				currentCSVPos++;
	62	+				break;
	63	+			}catch(NumberFormatException e){
	64	+			}
	65	+
	66	+		//read in instrument numbers
	67	+		temp=0;
	68	+		for(;currentCSVPos<csvFile.data.size();currentCSVPos++)
	69	+			try{																																//check if this is an integer
	70	+				instrument[temp]=Integer.parseInt(csvFile.data.elementAt(currentCSVPos).toString()); //this is a number, it has to be an intrument
	71	+				System.out.println("Instrument set to "+instrument[temp]+" on channel "+temp);
	72	+				temp++;
	73	+				if(temp>=nChannels){																							//collect numbers until you've reached the number of channels
	74	+					currentCSVPos++;
	75	+					break;
	76	+				}
	77	+			}catch(NumberFormatException e){
	78	+			}
	79	+
	80	+
	81	+		//***** Initialize Sequencer *****
	82	+		try{
	83	+			sequence = new Sequence(Sequence.PPQ, timingRes);   //initialize sequencer with timingRes
	84	+		}catch (InvalidMidiDataException e){
	85	+			e.printStackTrace();
	86	+			System.exit(1);
	87	+		}
	88	+
	89	+
	90	+		//***** Create tracks and notes *****
	91	+		/* Track objects cannot be created by invoking their constructor
	92	+		   directly. Instead, the Sequence object does the job. So we
	93	+		   obtain the Track there. This links the Track to the Sequence
	94	+		   automatically.
	95	+		*/
	96	+		Track track[] = new Track[nChannels];
	97	+		for(int i=0;i<nChannels;i++){
	98	+			track[i]=sequence.createTrack();                    //create tracks
	99	+	
	100	+			ShortMessage sm = new ShortMessage( );
	101	+        		sm.setMessage(ShortMessage.PROGRAM_CHANGE, i, instrument[i], 0);  //put in instrument[i] in this track
	102	+	        	track[i].add(new MidiEvent(sm, 0));
	103	+		}
	104	+
	105	+		int channel=0,note=0,tick=0,velocity=90,column=0;
	106	+
	107	+		//go through each of the following lines and add notes
	108	+		for(;currentCSVPos<csvFile.data.size();){							//loop through rest of CSV file
	109	+			try{																																			  //check that the current CSV position is an integer
	110	+				tick=Integer.parseInt(csvFile.data.elementAt(currentCSVPos).toString());  //first number is tick
	111	+				currentCSVPos+=2;
	112	+				note=Integer.parseInt(csvFile.data.elementAt(currentCSVPos).toString());  //next number is note
	113	+				currentCSVPos+=2;
	114	+				velocity=Integer.parseInt(csvFile.data.elementAt(currentCSVPos).toString());  //next number is velocity
	115	+				currentCSVPos++;
	116	+				channel=column/3;
	117	+				column+=2;
	118	+				track[channel].add(createNoteOnEvent(note,tick,channel,velocity));				//add note to this track
	119	+//				track[channel].add(createNoteOffEvent(note,tick+5,channel));
	120	+			}catch(NumberFormatException e){																						//current CSV position not an integer
	121	+				if(csvFile.data.elementAt(currentCSVPos).toString().compareTo("\n")==0){  //if it's a new line
	122	+					column=0;																																//go back to 1st column
	123	+				}else if(csvFile.data.elementAt(currentCSVPos).toString().compareTo(",")==0){ //if it's just a comma
	124	+					column++;
	125	+				}
	126	+				currentCSVPos++;
	127	+			}
	128	+		}
	129	+
	130	+
	131	+		// Print track information
	132	+		System.out.println();
	133	+		if ( track != null ) {
	134	+			for ( int i = 0; i < track.length; i++ ) {
	135	+				System.out.println( "Track " + i + ":" );
	136	+		
	137	+     		for ( int j = 0; j < track[i].size(); j++ ) {
	138	+					MidiEvent event = track[i].get( j );
	139	+ 					System.out.println(" tick "+event.getTick()+", "+MessageInfo.toString(event.getMessage()));
	140	+ 				} // for
	141	+ 			} // for
	142	+		} // if
	143	+
	144	+
	145	+
	146	+		/* Now we just save the Sequence to the file we specified.
	147	+		   The '0' (second parameter) means saving as SMF type 0.
	148	+		   (type 1 is for multiple tracks).
	149	+		*/
	150	+		try{
	151	+			MidiSystem.write(sequence, 1, outputFile);
	152	+		}catch (IOException e){
	153	+			e.printStackTrace();
	154	+			System.exit(1);
	155	+		}
	156	+	}
	157	+
	158	+
	159	+
	160	+
	161	+
	162	+
	163	+  //turns note on
	164	+	private static MidiEvent createNoteOnEvent(int nKey, long lTick,int channel,int velocity){
	165	+		return createNoteEvent(ShortMessage.NOTE_ON,nKey,velocity,lTick,channel);
	166	+	}
	167	+
	168	+	//turns note off
	169	+	private static MidiEvent createNoteOffEvent(int nKey, long lTick,int channel){
	170	+		return createNoteEvent(ShortMessage.NOTE_OFF,nKey,0,lTick,channel);  //set note to 0 velocity
	171	+	}
	172	+
	173	+	//turns note on or off
	174	+	private static MidiEvent createNoteEvent(int nCommand,int nKey,int nVelocity,long lTick,int channel){
	175	+		ShortMessage message = new ShortMessage();
	176	+		try{
	177	+			message.setMessage(nCommand,channel,nKey,nVelocity);
	178	+		}catch (InvalidMidiDataException e){
	179	+			e.printStackTrace();
	180	+			System.exit(1);
	181	+		}
	182	+		MidiEvent event = new MidiEvent(message,lTick);
	183	+		return event;
	184	+	}
	185	+
	186	+	private static void printUsageAndExit(){
	187	+		out("usage:");
	188	+		out("java CSV2MIDI <infile.csv> <outfile.midi>");
	189	+		System.exit(1);
	190	+	}
	191	+
	192	+	private static void out(String strMessage){
	193	+		System.out.println(strMessage);
	194	+	}
	195	+}
	196	+
