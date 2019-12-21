using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class PlayerCont : MonoBehaviour
{
    public DialogueManager dialogueManager;
    Vector2 input;
    bool isMoving = false;
    Vector3 startPos;
    Vector3 endPos;
    float t;
    public Animator animator;
    public float walkSpeed = 3f;
    public Stats stats;
    public Complete complete;
   public GameObject[] Past;
    public GameObject[] Future;

    // Start is called before the first frame update
    void Start()
    {
        animator = gameObject.GetComponent<Animator>();
        Past = GameObject.FindGameObjectsWithTag("Past");
        Future = GameObject.FindGameObjectsWithTag("Future");
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            stats.gameObject.SetActive(!stats.gameObject.activeSelf);
        }
        if (Input.GetKeyDown(KeyCode.Space))
        {
            NPCFind(transform.position);
        }
        if (Input.GetKeyDown(KeyCode.T))
        {
            foreach (GameObject obj in Future)
            {
                obj.SetActive(!gameObject.activeSelf);
            }
            foreach (GameObject obj in Past)
            {
                obj.SetActive(!gameObject.activeSelf);
            }
        }
        if(Save_Load_Manager.instance.data.score == 200)
        {
            complete.gameObject.SetActive(true);
            isMoving = true;
        }
        if (!isMoving && !dialogueManager.talking && ActionManager.instance.units_moving <= 0)
        {
            input = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));
            if (Mathf.Abs(input.x) > Mathf.Abs(input.y))
            {
                input.y = 0;
            }
            else
            {
                input.x = 0;
            }
            if (input != Vector2.zero)
            {
                if (input.x < 0)
                {
                 
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);
                }
                else if (input.x > 0)
                {
                    
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);

                }
                else if (input.y < 0)
                {
                   
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);

                }
                else if (input.y > 0)
                {
               
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);

                }

                StartCoroutine(Move(transform));
            }
            else
            {
                animator.SetFloat("Horizontal", 0);
                 animator.SetFloat("Vertical", 0);
            }
            if (Input.GetKeyDown(KeyCode.Return))
            {
                NPCFind(transform.position);
            }
        }
    }
    void NPCFind(Vector3 center)
    {
        float radius = .7f;
        Collider2D[] hitColliders = Physics2D.OverlapCircleAll(center, radius);
        int i = 0;
        if (hitColliders.Length>1)
        {
            GameObject npc = hitColliders[i].gameObject;
            dialogueManager.PlayDialogue(npc.name);
        }
    }
    public IEnumerator Move(Transform entity)
    {
        isMoving = true;
        startPos = entity.position;
        t = 0;
        endPos = new Vector3(startPos.x + (.5f *System.Math.Sign(input.x)), startPos.y + (.5f *System.Math.Sign(input.y)), startPos.z);
        while (t < 1f)
        {
            t += Time.deltaTime * walkSpeed;
            entity.position = Vector3.Lerp(startPos, endPos, t);
            yield return 0;
        }
       // ActionManager.instance.MoveAll();
        isMoving = false;
        yield return 0;
    }
    public IEnumerator Attack(GameObject npc)
    {
        Debug.Log(npc.name);
        NPC_action enemy = (NPC_action)npc.GetComponent(typeof(NPC_action));
        enemy.health -= Save_Load_Manager.instance.data.power - enemy.defense;
        Debug.Log(enemy.health);
        if(enemy.health <= 0)
        {
            enemy.gameObject.SetActive(false);
            Save_Load_Manager.instance.data.exp += 10;
        }
        ActionManager.instance.MoveAll();
        yield return 0;
    }
}