import 'package:flutter_todo/models/Exercise.dart';
import 'package:flutter_todo/database/databasehandler.dart';
import 'package:flutter_todo/models/Group.dart';
import 'package:flutter_todo/models/belongsIn.dart';

class PopulateDB{
  static void populateExercises(){
      List<Group> groups = new List<Group>();
      groups.add(new Group(name:"Chest"));
      groups.add(new Group(name:"Back"));
      groups.add(new Group(name:"Shoulders"));
      groups.add(new Group(name:"Biceps"));
      groups.add(new Group(name:"Triceps"));
      groups.add(new Group(name:"Forearms"));
      groups.add(new Group(name:"Core/Abs"));
      groups.add(new Group(name:"Glutes"));
      groups.add(new Group(name:"Quads"));
      groups.add(new Group(name:"Hamstrings"));
      groups.add(new Group(name:"Calves"));
      groups.add(new Group(name:"Cardio"));
      groups.add(new Group(name:"Full body"));
      groups.add(new Group(name:"Other"));

      for(int i=0; i<groups.length; i++){
        DBProvider.createGroup(groups.elementAt(i));
      }

      List<Exercise> exercises = new List<Exercise>();
      
      exercises.add(new Exercise(id: 0001.toString(), name:"Barbell bench press", type:0, pref:0, suf:0));
      exercises.add(new Exercise(id: 0002.toString(), name:"Incline barbell bench press", type:0, pref:0, suf:0));
      exercises.add(new Exercise(id: 0003.toString(), name:"Decline barbell bench press", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0004.toString(), name:"Dumbbell barbell bench press", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0005.toString(), name:"Dumbbell incline press", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0006.toString(), name:"Dumbbell decline press", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0007.toString(), name:"Pushup", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0008.toString(), name:"Close-grip pushup", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0009.toString(), name:"Close-grip bench press", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0010.toString(), name:"Dumbbell fly", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0011.toString(), name:"Incline dumbbell fly", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0012.toString(), name:"Cable fly", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0013.toString(), name:"High cable fly", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0014.toString(), name:"Low cable fly", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0015.toString(), name:"Machine fly", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0016.toString(), name:"Dips", type:1, pref:0, suf:0));
      exercises.add(new Exercise(id: 0017.toString(), name:"Machine press", type:1, pref:0, suf:0));
  
      for(int i=0; i<exercises.length; i++){
        DBProvider.createExercise(exercises.elementAt(i));
      }

      List<BelongsIn> belongsIn = new List<BelongsIn>();
      belongsIn.add(new BelongsIn(id: 0001.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0002.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0003.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0004.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0005.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0006.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0007.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0008.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0009.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0010.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0011.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0012.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0013.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0014.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0015.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0016.toString(), name:"Chest"));
      belongsIn.add(new BelongsIn(id: 0017.toString(), name:"Chest"));

      for(int i=0; i<belongsIn.length; i++){
        DBProvider.belongsInGroup(belongsIn.elementAt(i));
      }
  }




}
