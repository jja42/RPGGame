using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillDatabase : MonoBehaviour
{
    public List<Skill> skills = new List<Skill>();
    public void Awake()
    {
        BuildDatabase();
    }

    public Skill GetSkill(int id)
    {
        return skills.Find(skill => skill.id == id);
    }
    void BuildDatabase()
    {
        skills = new List<Skill>(){
            new Skill(1,"Burning Passion","A burning desire fuels your strength, granting you power.","All basic attacks do an extra 20% damage.",new int[0]),
            new Skill(2,"Fiery Fists","Your fists a lit with flames, burning your foes.", "Grants a 20% chance to set enemies on fire, dealing damage over time.",new int[1]{1}),
            new Skill(3,"Ring of Flames","By forcing your energy outwards you can create a deadly aura of flames that scorches nearby enemies.", "Active - All enemies within 1 tile from you will take 20 damage.",new int[1]{1}),
            new Skill(4,"Unerring Tide","The water's flow allows you to ensure your strikes connect.", "Gain 10% accuracy.",new int[0]),
            new Skill(5,"Flow Like Water","Your adaptability allows you to gradually outplay your opponents.", "For each successive successful hit on an enemy, gain an instance of Flow Like Water. Each instance grants you +5% dodge, accuracy and power against that enemy.",new int[1]{4}),
            new Skill(6,"Crashing Waves","After learning your enemy's patterns, you can overwhelm their defenses.", "Active - For each instance of Flow Like Water on an enemy, gain an extra strike against that target.",new int[1]{4 }),
            new Skill(7,"Hard as a Rock","By coating your skin with stone you've gained extra resistance to damage", "Gain 10 permanent defense",new int[0]),
            new Skill(8,"Shifting Earth","The very earth beneath your feet shifts to help you avoid attacks","Gain 20% dodge",new int[1]{7}),
            new Skill(9,"Jagged Edges","Your defenses double as weapons against foolish foes.","Active - You are unable to attack or move for one turn, any enemies that struck you during that turn take 125% of the damage they inflicted.",new int[1]{7}),
            new Skill(10,"Eye of the Storm","Your clear view of the world offers you deeper insight into the physical state of your enemies.","Grants the ability to see enemy HP and Defense values.",new int[0]),
            new Skill(11,"Air Strike","Your prowess with the wind allows you to project your power forward, hitting your foes from afar.", "You can now charge basic attacks, each turn spent charging increases the range of your next 3 attacks by 2 spaces.",new int[1]{10}),
            new Skill(12,"Wind Blades","The very air around you acts as your ally, keeping your foes at bay.","Active Select up to 3 targets within 5 spaces of yourself, these enemies will take 5 damage and be pushed back 1 space.",new int[1]{10}),
            new Skill(13,"Lightning Reflexes","You're always ready, your instincts priming you to strike quickly.","Gain 10% chance to counter attack.",new int[0]),
            new Skill(14,"Flash Step","Harnessing the speed of lightning, you're able to dash quickly from place to place.", "Active - Your next movement will move you 2 spaces instead of 1.",new int[1]{13}),
            new Skill(15,"Thunder Strike","Faster than a speeding bullet, you're able to strike your enemies as you hop around the battlefield.","Select a space on the map, you will dash to that space and deal 5 damage to all enemies in your path.", new int[1]{13 })
        };
    }
}
