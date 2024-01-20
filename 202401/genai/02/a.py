import sys

if "google.colab" in sys.modules:
    from google.colab import auth

    auth.authenticate_user()

import vertexai

PROJECT_ID = "<PROJECT_ID>"  # @param {type:"string"}
REGION = "us-central1"  # @param {type:"string"}

# Initialize Vertex AI SDK
vertexai.init(project=PROJECT_ID, location=REGION)

import pandas as pd
import seaborn as sns
from IPython.display import Markdown, display
from sklearn.metrics.pairwise import cosine_similarity
from vertexai.language_models import (
    TextGenerationModel,
    TextEmbeddingModel,
    ChatModel,
    InputOutputTextPair,
    CodeGenerationModel,
    CodeChatModel,
)

generation_model = TextGenerationModel.from_pretrained("text-bison@001")

prompt = "What is a large language model?"

response = generation_model.predict(prompt=prompt)

prompt = """Create a numbered list of 10 items. Each item in the list should be a trend in the tech industry.

Each trend should be less than 5 words."""  # try your own prompt

response = generation_model.predict(prompt=prompt)

my_industry = "tech"  # try changing this to a different industry

response = generation_model.predict(
    prompt=f"""Create a numbered list of 10 items. Each item in the list should
    be a trend in the {my_industry} industry.

    Each trend should be less than 5 words."""
)

temp_val = 0.0
prompt_temperature = "Complete the sentence: As I prepared the picture frame, I reached into my toolkit to fetch my:"

response = generation_model.predict(
    prompt=prompt_temperature,
    temperature=temp_val,
)


temp_val = 1.0

response = generation_model.predict(
    prompt=prompt_temperature,
    temperature=temp_val,
)

max_output_tokens_val = 5

response = generation_model.predict(
    prompt="List ten ways that generative AI can help improve the online shopping experience for users",
    max_output_tokens=max_output_tokens_val,
)

max_output_tokens_val = 500

response = generation_model.predict(
    prompt="List ten ways that generative AI can help improve the online shopping experience for users",
    max_output_tokens=max_output_tokens_val,
)

display(Markdown(response.text))

top_p_val = 0.0
prompt_top_p_example = (
    "Create a marketing campaign for jackets that involves blue elephants and avocados."
)

response = generation_model.predict(
    prompt=prompt_top_p_example, temperature=0.9, top_p=top_p_val
)

top_p_val = 1.0

response = generation_model.predict(
    prompt=prompt_top_p_example, temperature=0.9, top_p=top_p_val
)

prompt_top_k_example = "Write a 2-day itinerary for France."
top_k_val = 1

response = generation_model.predict(
    prompt=prompt_top_k_example, max_output_tokens=300, temperature=0.9, top_k=top_k_val
)

top_k_val = 40

response = generation_model.predict(
    prompt=prompt_top_k_example,
    max_output_tokens=300,
    temperature=0.9,
    top_k=top_k_val,
)

chat_model = ChatModel.from_pretrained("chat-bison@001")

chat = chat_model.start_chat()

chat.send_message(
    """
Hello! Can you write a 300 word abstract for a research paper I need to write about the impact of AI on society?
"""
)

chat.send_message(
    """
Could you give me a catchy title for the paper?
"""
)

chat = chat_model.start_chat(
    context="My name is Ned. You are my personal assistant. My favorite movies are Lord of the Rings and Hobbit.",
    examples=[
        InputOutputTextPair(
            input_text="Who do you work for?",
            output_text="I work for Ned.",
        ),
        InputOutputTextPair(
            input_text="What do I like?",
            output_text="Ned likes watching movies.",
        ),
    ],
    temperature=0.3,
    max_output_tokens=200,
    top_p=0.8,
    top_k=40,
)

embedding_model = TextEmbeddingModel.from_pretrained("textembedding-gecko@001")

embeddings = embedding_model.get_embeddings(["What is life?"])

for embedding in embeddings:
    vector = embedding.values
text = [
    "i really enjoyed the movie last night",
    "so many amazing cinematic scenes yesterday",
    "had a great time writing my Python scripts a few days ago",
    "huge sense of relief when my .py script finally ran without error",
    "O Romeo, Romeo, wherefore art thou Romeo?",
]

df = pd.DataFrame(text, columns=["text"])
df

df["embeddings"] = df.apply(
    lambda x: embedding_model.get_embeddings([x.text])[0].values, axis=1
)
df

cos_sim_array = cosine_similarity(list(df.embeddings.values))

# display as DataFrame
df = pd.DataFrame(cos_sim_array, index=text, columns=text)
df

ax = sns.heatmap(df, annot=True, cmap="crest")
ax.xaxis.tick_top()
ax.set_xticklabels(text, rotation=90)

code_generation_model = CodeGenerationModel.from_pretrained("code-bison@001")

prefix = "write a python function to do binary search"

response = code_generation_model.predict(prefix=prefix)

prefix = """write a python function named as "calculate_cosine_similarity" and three unit \
            tests where it takes two arguments "vector1" and "vector2". \
            It then uses numpy dot function to calculate the dot product of the two vectors. \n
          """

response = code_generation_model.predict(prefix=prefix, max_output_tokens=1024)

language = "C++ function"
file_format = "json"
extract_info = "names"
requirments = """
              - the name should be start with capital letters.
              - There should be no duplicate names in the final list.
              """

prefix = f"""Create a {language} to parse {file_format} and extract {extract_info} with the following requirements: {requirments}.
              """

response = code_generation_model.predict(prefix=prefix, max_output_tokens=1024)

code_completion_model = CodeGenerationModel.from_pretrained("code-gecko@001")

prefix = """
          def find_x_in_string(string_s, x):
         """

response = code_completion_model.predict(prefix=prefix, max_output_tokens=64)

prefix = """
         def reverse_string(s):
            return s[::-1]
         def test_empty_input_string()
         """

response = code_completion_model.predict(prefix=prefix, max_output_tokens=64)

code_chat_model = CodeChatModel.from_pretrained("codechat-bison@001")

code_chat = code_chat_model.start_chat()

code_chat.send_message(
    "Please help write a function to calculate the min of two numbers",
)

code_chat.send_message(
    "can you explain the code line by line in bullets?",
)

code_chat = code_chat_model.start_chat()

code_chat.send_message(
    "what is the most scalable way to traverse a list in python?",
)

code_chat.send_message(
    "how would i measure the iteration per second for the following code?",
)

