using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill
{
    public int id;
    public string title;
    public string description;
    public string ability;
    public int[] prereqs;
    public Sprite icon;
    public Skill(int id, string title, string description, string ability, int[] prereqs)
    {
        this.id = id;
        this.title = title;
        this.description = description;
        this.ability = ability;
        this.prereqs = prereqs;
        icon = Resources.Load<Sprite>("Sprites/" + this.title);
        
    }
}