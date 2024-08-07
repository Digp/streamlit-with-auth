import streamlit as st

# Application title
st.title("My First Streamlit Application")

# Welcome text
st.write("Hello, world! This is a basic Streamlit application.")

# Slider
value = st.slider("Select a value", 0, 100, 50)

# Display the selected value
st.write(f"You have selected: {value}")
