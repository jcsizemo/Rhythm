/**
 * CSV2MIDI.java
 * June 11, 2003
 * @author: Stephen Steffes
 * Purpose:  Converts a .csv file to a MIDI file according to ExampleMIDI.csv
 */


import java.io.*;

import javax.sound.midi.*;

import java.lang.*;


public class rym2MIDI{



	public static void main(String[] args)	throws InvalidMidiDataException, IOException {

		//***** Get Inputs *****
		if (args.length != 2)
			printUsageAndExit();

		//instrument and timingRes are default.
		int timingRes=4, instrument = 1;
		int channel=0,note=0,tick=0,velocity=90,column=0;

		Sequence sequence = null;		
		File outputFile = new File(args[1]);

		//***** Initialize array ******
		int NoteArr[][][] = new int[100][][];
		int trackinfo[][] = new int[100][2];


		FileInputStream fstream = new FileInputStream(args[0]);
		// Get the object of DataInputStream
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));


		String strLine;
		int LineNum = 0;
		int track_num = -1;
		int total_track_num = 0;
		int track_assigned = -2;
		int ArrTemp[][] = new int[10000][2];
		//Read File Line By Line
		while ((strLine = br.readLine()) != null)   {
			// Print the content on the console
			strLine = strLine.trim();
			if (strLine.indexOf("Track")>=0) {
				track_num = getTrackNum(strLine);
				LineNum = 0;
				ArrTemp = new int[10000][2];
			}
			else if(strLine.equals("")||strLine.equals("EOF")){
				//System.out.println (strLine);
				if(track_assigned != track_num){
					NoteArr[track_num] = new int[LineNum][2];
					for(int i = 0; i < LineNum; i++){
						NoteArr[track_num][i] = ArrTemp[i];					
					}
					track_assigned = track_num;
					trackinfo[total_track_num][0] = track_num;
					trackinfo[total_track_num][1] = LineNum;
					total_track_num = total_track_num + 1;
				}
			}
			else{
				//System.out.println (strLine);								
				ArrTemp[LineNum] = getTickAndNote(strLine);
				LineNum = LineNum + 1;
			}
		}

		if(track_assigned != track_num){
			NoteArr[track_num] = new int[LineNum][2];
			for(int i = 0; i < LineNum; i++){
				NoteArr[track_num][i] = ArrTemp[i];					
			}
			track_assigned = track_num;
			trackinfo[total_track_num][0] = track_num;
			trackinfo[total_track_num][1] = LineNum;
			total_track_num = total_track_num + 1;
		}
		
		int nChannels = total_track_num;



		
		//***** Initialize Sequencer *****
		try{
			sequence = new Sequence(Sequence.PPQ, timingRes);   //initialize sequencer with timingRes
		}catch (InvalidMidiDataException e){
			e.printStackTrace();
			System.exit(1);
		}

		
		//***** Create tracks and notes *****
		/* Track objects cannot be created by invoking their constructor
				   directly. Instead, the Sequence object does the job. So we
				   obtain the Track there. This links the Track to the Sequence
				   automatically.
		 */
		Track track[] = new Track[nChannels];
		for(int i=0;i<nChannels;i++){
			track[i]=sequence.createTrack();                    //create tracks

			ShortMessage sm = new ShortMessage( );
			sm.setMessage(ShortMessage.PROGRAM_CHANGE, i, instrument, 0);  //put in instrument[i] in this track
			track[i].add(new MidiEvent(sm, 0));
		}
		
	
	for(int ti=0; ti<nChannels;ti++){
		int tracknum = trackinfo[ti][0];
		int notelen = trackinfo[ti][1];
		int OneTrack[][] = NoteArr[tracknum];
		for(int ni=0; ni<notelen; ni++){
			tick = OneTrack[ni][0];
			note = OneTrack[ni][1];
			channel = ti;
			track[channel].add(createNoteOnEvent(note,tick,channel,velocity));
		}
	}
	
	try{
		MidiSystem.write(sequence, 1, outputFile);
	}catch (IOException e){
		e.printStackTrace();
		System.exit(1);
	}
	}







	//turns note on
	private static MidiEvent createNoteOnEvent(int nKey, long lTick,int channel,int velocity){
		return createNoteEvent(ShortMessage.NOTE_ON,nKey,velocity,lTick,channel);
	}

	//turns note off
	private static MidiEvent createNoteOffEvent(int nKey, long lTick,int channel){
		return createNoteEvent(ShortMessage.NOTE_OFF,nKey,0,lTick,channel);  //set note to 0 velocity
	}

	//turns note on or off
	private static MidiEvent createNoteEvent(int nCommand,int nKey,int nVelocity,long lTick,int channel){
		ShortMessage message = new ShortMessage();
		try{
			message.setMessage(nCommand,channel,nKey,nVelocity);
		}catch (InvalidMidiDataException e){
			e.printStackTrace();
			System.exit(1);
		}
		MidiEvent event = new MidiEvent(message,lTick);
		return event;
	}

	private static void printUsageAndExit(){
		out("usage:");
		out("java CSV2MIDI <infile.csv> <outfile.midi>");
		System.exit(1);
	}

	private static void out(String strMessage){
		System.out.println(strMessage);
	}

	private static int getTrackNum(String track_label){
		int startnum = track_label.indexOf("Track");
		int endnum = track_label.indexOf(":");
		String NumStr = track_label.substring(startnum+5,endnum);
		int Num = Integer.parseInt(NumStr.trim());
		return Num;
	}

	private static int[] getTickAndNote(String strline){
		int blanknum = strline.indexOf(" ");
		int arr_two[] = new int[2];
		String Tick = strline.substring(0,blanknum);
		String Note = strline.substring(blanknum+1,strline.length());
		arr_two[0] = Integer.parseInt(Tick.trim());
		arr_two[1] = Integer.parseInt(Note.trim());
		return arr_two;

	}

}

