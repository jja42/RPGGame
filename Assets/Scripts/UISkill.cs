using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class UISkill : MonoBehaviour, IPointerClickHandler
{
    public Skill skill;
    private Image spriteImage;
    public GameObject entity;
    private void Awake()
    {
        spriteImage = GetComponent<Image>();
        UpdateSkill(null);
        entity = GameObject.FindGameObjectsWithTag("Player")[0];
    }
    public void UpdateSkill(Skill skill)
    {
        this.skill = skill;
        if (this.skill != null)
        {
            spriteImage.color = Color.white;
            spriteImage.sprite = this.skill.icon;
        }
        else
        {
            spriteImage.color = Color.clear;
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        SkillTree skilltree = (SkillTree)entity.GetComponent(typeof(SkillTree));
        skilltree.AquireSkill(this.skill);
    }
}