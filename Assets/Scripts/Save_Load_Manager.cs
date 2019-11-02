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
    public int defense = 5;
    public int power = 5;
    public int exp = 0;
    public float accuracy = .5f;
    public float dodge = .05f;
    public float counter = .05f;
    public int health_points = 30;
    public int[] rep = { 0, 0, 0, 0 };
    public int saved = 0;
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