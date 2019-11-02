using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillTree : MonoBehaviour
{
    public List<Skill> characterSkills = new List<Skill>();
    public SkillDatabase skillDatabase;
    public UISkillTree skilltreeUI;
    public void Start()
    {
        SetSkill(1);
        SetSkill(2);
        SetSkill(3);
    }
    public void Update()
    {
        if (Input.GetKeyDown(KeyCode.K))
        {
            skilltreeUI.gameObject.SetActive(!skilltreeUI.gameObject.activeSelf);
        }
    }
    public void SetSkill(int skillid)
    {
         Skill skillToSet = skillDatabase.GetSkill(skillid);
         skilltreeUI.gameObject.SetActive(true);
         skilltreeUI.AddSkill(skillToSet);
         skilltreeUI.gameObject.SetActive(false);
    }
    public void AquireSkill(Skill skill)
    {
        Debug.Log(skill.title);
        if (!CheckForSkill(skill.title))
        {
            Debug.Log(skill.title + " already acquired");
            return;
        }
            for(int i = 0; i<skill.prereqs.Length;i++)
            {
                if (CheckForReq(skill.prereqs[i]))
                {
                    Debug.Log("Missing Prereq: " + skillDatabase.GetSkill(skill.prereqs[i]).title);
                    return;
                }
            }
            characterSkills.Add(skill);
        }

    public bool CheckForSkill(string skillname)
    {
        if (characterSkills.Find(skill => skill.title == skillname) != null)
        {
            return false;
        }
        return true;
    }
    public bool CheckForReq(int id)
    {
        if (characterSkills.Find(skill => skill.id == id) != null)
        {
            return false;
        }
        return true;
    }
}
