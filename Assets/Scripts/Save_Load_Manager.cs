using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;

public class Save_Load_Manager : MonoBehaviour
{
    public static Save_Load_Manager instance;
    public Data data;
    string datafile = "save.sav";
    // Update is called once per frame
    private void Start()
    {
        for (int i = 0; i < 50; i++)
        {
            data.moods[i] = Random.Range(1, 4);
        }
        data.moods[25] = data.moods[0];
        data.moods[26] = data.moods[8];
        data.moods[28] = data.moods[9];
        data.moods[31] = data.moods[10];
        data.moods[33] = data.moods[11];
        data.moods[34] = data.moods[13];
        data.moods[37] = data.moods[15];
        data.moods[38] = data.moods[16];
        data.moods[39] = data.moods[4];
        data.moods[41] = data.moods[18];
        data.moods[44] = data.moods[20];
        data.moods[46] = data.moods[21];
        data.moods[48] = data.moods[23];
        for (int i = 0; i < 4; i++) {
            data.rep[i] = 1;
        }
    }
    void Awake()
    {
       if (instance == null)
        {
            DontDestroyOnLoad(this.gameObject);
            instance = this;
        }
       else if (instance != this)
        {
            Destroy(this.gameObject);
        }
    }
   public void Save()
    {
        string filePath = Application.persistentDataPath + "/" + datafile;
        BinaryFormatter bf = new BinaryFormatter();
        FileStream file = File.Create(filePath);
        bf.Serialize(file, data);
        file.Close();
    }
    public void Load()
    {
        string filePath = Application.persistentDataPath + "/" + datafile;
        BinaryFormatter bf = new BinaryFormatter();
        if (File.Exists(filePath))
        {
            FileStream file = File.Open(filePath, FileMode.Open);
            Data loaded = (Data) bf.Deserialize(file);
            data = loaded;
            file.Close();
        }
    }
}
[System.Serializable]
public class Data
{
    public Position player = null;
    public Position[] entities = null;
    public int level = 1;
    public int fire = 1;
    public int wind = 1;
    public int water = 1;
    public int earth = 1;
    public int lightning = 1;
    public int health= 5;
    public int defense = 1;
    public int power = 1;
    public int exp = 0;
    public float accuracy = .5f;
    public float dodge = .05f;
    public float counter = .05f;
    public int health_points = 30;
    public int max_health_points = 30;
    public int[] rep = { 1, 1, 1, 1 };
    public int saved = 0;
    public int[] moods = new int[50];
    public int[] flags = new int[13];
    public int score = 0;
}
[System.Serializable]
public class Position
{
    public float x;
    public float y;
    public float z;

    public Position(Vector3 p)
    {
        x = p.x;
        y = p.y;
        z = p.z;
    }
    public Vector3 toVector3() {
        return new Vector3(x, y, z); 
    }
}