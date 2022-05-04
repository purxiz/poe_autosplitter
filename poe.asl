state("PathOfExile") {}
startup {
    vars.zones_one = new Dictionary<string, bool> {
        { "Lioneye's Watch", false },
        { "The Coast", false },
        { "The Mud Flats", false },
        { "The Tidal Island", false },
        { "The Submerged Passage", false },
        { "The Ledge", false },
        { "The Climb", false },
        { "The Lower Prison", false },
        { "The Upper Prison", false },
        { "Prisoner's Gate", false },
        { "The Ship Graveyard", false },
        { "The Cavern of Wrath", false },
        { "The Cavern of Anger", false },
        { "The Southern Forest", false },
        { "The Forest Encampment", false },
        { "The Old Fields", false },
        { "The Crossroads", false },
        { "The Chamber of Sins Level 1", false },
        { "The Chamber of Sins Level 2", false },
        { "The Fellshrine Ruins", false },
        { "The Riverways", false },
        { "The Western Forest", false },
        { "The Weaver's Chambers", false },
        { "The Wetlands", false },
        { "The Broken Bridge", false },
        { "The Vaal Ruins", false },
        { "The Northern Forest", false },
        { "The Caverns", false },
        { "The Ancient Pyramid", false },
        { "The City of Sarn", false },
        { "The Sarn Encampment", false },
        { "The Slums", false },
        { "The Crematorium", false },
        { "The Sewers", false },
        { "The Marketplace", false },
        { "The Catacombs", false },
        { "The Battlefront", false },
        { "The Solaris Temple Level 1", false },
        { "The Solaris Temple Level 2", false },
        { "The Docks", false },
        { "The Ebony Barracks", false },
        { "The Lunaris Temple Level 1", false },
        { "The Lunaris Temple Level 2", false },
        { "The Imperial Gardens", false },
        { "The Library", false },
        { "The Sceptre of God", false },
        { "The Upper Sceptre of God", false },
        { "The Aqueduct", false },
        { "Highgate", false },
        { "The Dried Lake", false },
        { "The Mines Level 1", false },
        { "The Mines Level 2", false },
        { "The Crystal Veins", false },
        { "Daresso's Dream", false },
        { "The Grand Arena", false },
        { "Kaom's Dream", false },
        { "Kaom's Stronghold", false },
        { "The Belly of the Beast Level 1", false },
        { "The Belly of the Beast Level 2", false },
        { "The Harvest", false },
        { "The Ascent", false },
        { "The Slave Pens", false },
        { "Overseer's Tower", false },
        { "The Control Blocks", false },
        { "Oriath Square", false },
        { "The Templar Courts", false },
        { "The Chamber of Innocence", false },
        { "The Torched Courts", false },
        { "The Ruined Square", false },
        { "The Ossuary", false },
        { "The Reliquary", false },
        { "The Cathedral Rooftop", false},
    };
    vars.zones_two = new Dictionary<string, bool> {
        { "Lioneye's Watch", false },
        { "The Coast", false },
        { "The Mud Flats", false },
        { "The Karui Fortress", false },
        { "The Ridge", false },
        { "The Lower Prison", false },
        { "Shavronne's Tower", false },
        { "Prisoner's Gate", false },
        { "The Western Forest", false },
        { "The Riverways", false },
        { "The Wetlands", false },
        { "The Southern Forest", false },
        { "The Cavern of Anger", false },
        { "The Beacon", false },
        { "The Brine King's Reef", false },
        { "The Bridge Encampment", false },
        { "The Broken Bridge", false },
        { "The Crossroads", false },
        { "The Fellshrine Ruins", false },
        { "The Crypt", false },
        { "The Chamber of Sins Level 1", false },
        { "Maligaro's Sanctum", false },
        { "The Chamber of Sins Level 2", false },
        { "The Den", false },
        { "The Ashen Fields", false },
        { "The Northern Forest", false },
        { "The Dread Thicket", false },
        { "The Causeway", false },
        { "The Vaal City", false },
        { "The Temple of Decay Level 1", false },
        { "The Temple of Decay Level 2", false },
        { "The Sarn Ramparts", false },
        { "The Sarn Encampment", false },
        { "The Toxic Conduits", false },
        { "Doedre's Cesspool", false },
        { "The Quay", false },
        { "The Grain Gate", false },
        { "The Imperial Fields", false },
        { "The Solaris Temple Level 1", false },
        { "The Solaris Temple Level 2", false },
        { "The Grand Promenade", false },
        { "The Bath House", false },
        { "The High Gardens", false },
        { "The Lunaris Concourse", false },
        { "The Lunaris Temple Level 1", false },
        { "The Lunaris Temple Level 2", false },
        { "The Harbour Bridge", false },
        { "The Blood Aqueduct", false },
        { "Highgate", false },
        { "The Descent", false },
        { "The Vastiri Desert", false },
        { "The Oasis", false },
        { "The Foothills", false },
        { "The Boiling Lake", false },
        { "The Tunnel", false },
        { "The Quarry", false },
        { "The Refinery", false },
        { "The Belly of the Beast", false },
        { "The Rotting Core", false },
        { "Oriath Docks", false },
        { "The Cathedral Rooftop", false },
        { "The Ravaged Square", false },
        { "The Torched Courts", false },
        { "The Desecrated Chambers", false },
        { "The Ossuary", false },
        { "The Control Blocks", false },
        { "The Canals", false },
        { "The Feeding Trough", false },
        { "Oriath", false },
    };
    vars.part_two = false;
}

init {
  string logPath;
  logPath = ("C:\\Program Files (x86)\\Grinding Gear Games\\Path of Exile\\logs\\Client.txt");
  try { // Wipe the log file to clear out messages from last time
    FileStream fs = new FileStream(logPath, FileMode.Open, FileAccess.Write, FileShare.ReadWrite);
    fs.SetLength(0);
    fs.Close();
    print("file loaded");
  } catch {
      print("File doesn't exist");
  } // May fail if file doesn't exist.
  vars.reader = new StreamReader(new FileStream(logPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)); 
}

update {
  vars.line = vars.reader.ReadLine();
  if (vars.line == null) return false; // If no line was read, don't run any other blocks.
}

split {
    if (vars.line == null) return false;
    if(!vars.line.Contains("You have entered")) return false;
    var zone = vars.line.Split(new[] { "You have entered " }, StringSplitOptions.None);
    zone = zone[1].Trim('.');
    if(!vars.part_two) {
        if(vars.zones_one.ContainsKey(zone) && vars.zones_one[zone] == false) {
            vars.zones_one[zone] = true;
            if(zone == "The Cathedral Rooftop") vars.part_two = true;
            return true;
        }
    }
    else {
        if(vars.zones_two.ContainsKey(zone) && vars.zones_two[zone] == false) {
            vars.zones_two[zone] = true;
            return true;
        }
    }
    return false;
}

exit {
    vars.reader = null;
}