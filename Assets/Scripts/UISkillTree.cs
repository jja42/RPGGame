using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UISkillTree : MonoBehaviour
{
    public List<UISkill> UISkills = new List<UISkill>();
    public GameObject slotPrefab;
    public Transform slotPanel;
    public int numberOfSlots = 3;
    private void Start()
    {
        for (int i = 0; i < numberOfSlots; i++)
        {
            GameObject instance = Instantiate(slotPrefab);
            instance.transform.SetParent(slotPanel);
            UISkills.Add(instance.GetComponentInChildren<UISkill>());
        }
    }
    public void UpdateSlot(int slot, Skill skill)
    {
        UISkills[slot].UpdateSkill(skill);
    }
    public void AddSkill(Skill skill)
    {
        UpdateSlot(UISkills.FindIndex(i => i == null || i.skill == null), skill);
    }
}
