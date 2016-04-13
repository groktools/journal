# journal
Store your thoughts about code - in the code!

# Introduction
**journal** is a simple tool to track your thoughts as you code. It allows you to write memos to yourself (and potentially other team members) to explain the concepts that go into your code better. Or maybe its just notes that dont fit anywhere else or maybe they're high level todos. You decide!

#Why journal
As found by [Maalej et al](https://mobis.informatik.uni-hamburg.de/wp-content/uploads/2014/06/TOSEM-Maalej-Comprehension-PrePrint2.pdf) (page 27, emphasis mine):
> Context information also seems to play an important role when supplying the knowledge needs of developers in program comprehension scenarios. For instance, **the context of the task in which the program was developed, including the rationale, the developer’s intention when writing the code, and the intended usage of the program, seems to be frequently needed by developers** (see Finding 4, Finding 20, Finding 23 and Figure 3).
**Unfortunately, our findings reveal that context information is typically implicit and not captured.** For example, respondents rated missing context of documented knowledge about programs as one of the most frequent knowledge access barriers. Similarly, context switching overhead was rated as one of the most frequent knowledge sharing barriers.

>**One possible strategy to overcome these barriers is an integrated, context-aware tool support for knowledge exchange: enabling a (semi-) automatically capturing and sharing of knowledge with its context by observing developers’ interactions** [Maalej et al. 2014]. Moreover, insights about the work patterns of developers from this and other studies (e.g., Murphy et al. [2006]; Parnin and Rugaber [2009]) can be used to build personalized tools that are aligned to the workflow of developers. For example a tool that detects the current high-level activity of developers from low-level actions can be used to provide only information that is relevant for the current problem [Roehm and Maalej 2012].

This tool latches onto the idea of a context-aware tool that captures and stores the knowledge of the developer **as the code is built** for use by both the primary author and others later.

# Install

Currently, journal is an Atom Plugin. Once its published to the Atom package site, you should be able to pull it down from inside atom itself.

# Usage

Once installed, you'll get two menu options: "Open Journal" and "Add Entry". The first one will open up a new `journal.md` file if one doesnt exist, and the second one will create a new line with the current timestamp - all ready for you to make journal entries. Dont forget to check the journal file in when you commit the code!
