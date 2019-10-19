using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DialogueManager : MonoBehaviour
{
    private Story story;
    public Text textPrefab;
    public Button buttonPrefab;
    public bool talking = false;
    public int[] rep = { 0, 0, 0, 0 };

    // Start is called before the first frame update
    public void PlayDialogue(string name)
    {
        talking = true;
        string title = name;
        TextAsset inkJSON = Resources.Load<TextAsset>("Ink/" + title );
        story = new Story(inkJSON.text);

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
        if(story.currentChoices.Count == 0)
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
        if ((string) story.variablesState["rep"] == "agg_true")
        {
            rep[0] += 1;
        }
        else if ((string)story.variablesState["rep"] == "agg_false")
        {
            rep[0] += -1;
        }
        else if ((string)story.variablesState["rep"] == "prag_true")
        {
            rep[1] += 1;
        }
        else if ((string)story.variablesState["rep"] == "prag_false")
        {
            rep[1] += -1;
        }
        else if ((string)story.variablesState["rep"] == "emp_true")
        {
            rep[2] += 1;
        }
        else if ((string)story.variablesState["rep"] == "emp_false")
        {
            rep[2] += -1;
        }
        else if ((string)story.variablesState["rep"] == "apath_true")
        {
            rep[3] += 1;
        }
        else if ((string)story.variablesState["rep"] == "apath_false")
        {
            rep[3] += -1;
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