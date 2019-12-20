using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class DialogueManager : MonoBehaviour
{
    private Story story;
    public Text textPrefab;
    public Button buttonPrefab;
    public bool talking = false;
    public Inventory inventory;
    // Start is called before the first frame update
    public void PlayDialogue(string name)
    {
        talking = true;
        string title = name;
        TextAsset inkJSON = Resources.Load<TextAsset>("Ink/" + title);
        story = new Story(inkJSON.text);
        story.BindExternalFunction("check_rep", (string rep) =>
        {
            if (rep == "aggression")
            {
                return Save_Load_Manager.instance.data.rep[0];
            }
            if (rep == "pragmatism")
            {
                return Save_Load_Manager.instance.data.rep[1];
            }
            if (rep == "empathy")
            {
                return Save_Load_Manager.instance.data.rep[2];
            }
            if (rep == "apathy")
            {
                return Save_Load_Manager.instance.data.rep[3];
            }
            return 0;
        });
        story.BindExternalFunction("set_flag", (int flag) =>
        {
            Save_Load_Manager.instance.data.flags[flag] = 1;
            return 0;
        });
        story.BindExternalFunction("money_transfer", (int money) =>
        {
            Save_Load_Manager.instance.data.money += money;
            return 0;
        });
        story.BindExternalFunction("check_mood",(int id) =>
        {
            return Save_Load_Manager.instance.data.moods[id];
        });
        story.BindExternalFunction("check_item", (string item) =>
        {

            if (inventory.CheckForItem(item) != null)
            {
                return 1;
            }
            return 0;
        });
        refreshUI();
    }

    void refreshUI()
    {
        eraseUI();

        Text storyText = Instantiate(textPrefab) as Text;
        storyText.text = loadStoryChunk();
        storyText.transform.SetParent(this.transform, false);

        foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);

            // Gets the text from the button prefab
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = choice.text;

            // Set listener
            choiceButton.onClick.AddListener(delegate
            {
                chooseStoryChoice(choice);
            });
        }
        if (story.currentChoices.Count == 0)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = "Exit";
            choiceButton.onClick.AddListener(delegate
            {
                ExitStory();
            });
        }
    }
    void ExitStory()
    {
        if ((string)story.variablesState["rep"] == "agg_true")
        {
            Save_Load_Manager.instance.data.rep[0] += 1;
        }
        else if ((string)story.variablesState["rep"] == "agg_false")
        {
            Save_Load_Manager.instance.data.rep[0] += -1;
        }
        else if ((string)story.variablesState["rep"] == "prag_true")
        {
            Save_Load_Manager.instance.data.rep[1] += 1;
        }
        else if ((string)story.variablesState["rep"] == "prag_false")
        {
            Save_Load_Manager.instance.data.rep[1] += -1;
        }
        else if ((string)story.variablesState["rep"] == "emp_true")
        {
            Save_Load_Manager.instance.data.rep[2] += 1;
        }
        else if ((string)story.variablesState["rep"] == "emp_false")
        {
            Save_Load_Manager.instance.data.rep[2] += -1;
        }
        else if ((string)story.variablesState["rep"] == "apath_true")
        {
            Save_Load_Manager.instance.data.rep[3] += 1;
        }
        else if ((string)story.variablesState["rep"] == "apath_false")
        {
            Save_Load_Manager.instance.data.rep[3] += -1;
        }
        if ((string)story.variablesState["giveitem"] != null)
        {
            string item = (string)story.variablesState["giveitem"];
            inventory.GiveItem(item);
        }
        if ((string)story.variablesState["removeitem"] != null)
        {
            string item = (string)story.variablesState["removeitem"];
            inventory.RemoveItem(item);
        }
        talking = false;
        eraseUI();
    }

    void eraseUI()
    {
        for (int i = 0; i < this.transform.childCount; i++)
        {
            Destroy(this.transform.GetChild(i).gameObject);
        }
    }

    void chooseStoryChoice(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refreshUI();
    }

    // Update is called once per frame
    void Update()
    {

    }

    string loadStoryChunk()
    {
        string text = "";
        text = story.ContinueMaximally();
        if (story.canContinue)
        {
            text = story.ContinueMaximally();
        }
        return text;
    }
}