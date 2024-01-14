%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vignesh Iyer                                 %
% MS CSE ASU                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/01/11 v0.2 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[left=0.5in,top=0.4in,right=0.5in,bottom=0.4in]{geometry} % set document margins
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{etoolbox}
\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
\usepackage[scaled]{helvet} % Load the Helvetica font
\renewcommand\familydefault{\sfdefault} % Set the  font family to sans-serif
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

% -------------- README --------------
% Visit https://github.com/vgnshiyer/ASU-sparkysundevil-resume-template for comprehensive documenation.

% ------------ Utilities ------------

\def \separator {
    \textbf{\Large\textbullet}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}%
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}%

\newcommand{\isA}[1]{
    \expandafter\ifstrequal\expandafter{#1}{default}{}{a}
}

\newcommand\sectionTitle[1]{%
    \begingroup
        \textbf{\MakeUppercase{#1}}
        \vspace{0.4em}
        \hrule
        \vspace{-0.3em}
    \endgroup
}%

% ------------------------------------

% ------------- Header --------------
\newcommand\printNameTitle[1]{%
    \begingroup
        \hfill{\MakeUppercase{\Huge\bfseries #1}}\hfill
        \break
        \vspace{-0.5em}
        \hrule
    \endgroup
}%

\newkeycommand{\introduction}[
    fullname,
    email,
    phone,
    linkedin,
    github
]{%
    \begin{center}%
        \printNameTitle{\commandkey{fullname}}% Full name title
        {%
            \expandafter\ifstrequal\expandafter{phone}{}{}% Contact number
            {%
                \ifcommandkey{phone}{\commandkey{phone}}{}%
                \expandafter\ifstrequal\expandafter{email}{}%
                {%
                    \expandafter\ifstrequal\expandafter{linkedin}{}%
                    {%
                        \expandafter\ifstrequal\expandafter{github}{}%
                        {%
                            % empty %
                        }{\separator}%
                    }{\separator}%
                }{\separator}%
            }% Contact number field ends here
            \expandafter\ifstrequal\expandafter{email}{}{}% Email
            {%
                \email{\commandkey{email}}%
                \expandafter\ifstrequal\expandafter{linkedin}{}%
                {%
                    \expandafter\ifstrequal\expandafter{github}{}%
                    {%
                        % empty %
                    }{\separator}%
                }{\separator}%
            }% Email fields ends here
            \expandafter\ifstrequal\expandafter{linkedin}{}{}% Linkedin
            {%
                \profilelink{\commandkey{linkedin}}
                \expandafter\ifstrequal\expandafter{github}{}
                {%
                    % empty %
                }{\separator}%
            }% Linkedin field ends here
            \expandafter\ifstrequal\expandafter{github}{}{}% Github
            {%
                \profilelink{\commandkey{github}}%
            }% Github field ends here
        }
    \end{center}%
}%

% -----------------------------------

% ------------ Summary --------------
\newcommand{\summary}[1]{%
    \sectionTitle{Summary}%
    #1
}%

% -----------------------------------

% ------------ Education ------------
\newenvironment{educationSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\educationItem}[
    university,
    college,
    program,
    graduation,
    grade,
    coursework
]{%
    {% line 1
        \bf \commandkey{program}%
    } \hfill {%
        Graduating \commandkey{graduation}%
    } \\ % line end
    {% line 2
        \commandkey{university}%
    } \hfill \ifcommandkey{grade}{% Grade field is optional (Can be left empty)
        \commandkey{grade}%
    }{} \\ % line end
    {% line 3
        \commandkey{college}
    } \\ % line end
    {% line 4
        Relevant coursework: \commandkey{coursework}%
    }% line end
}%

% ------------------------------------

% -------------- Skills --------------
\newenvironment{skillsSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\skillItem}[
    category,
    skills
]{%
    {%
        \bf \commandkey{category}:
    } {%
        \commandkey{skills}%
    }
}%

% ------------------------------------

% -------------- Experience -------------
\newenvironment{experienceSection}[1]{%
    \sectionTitle{#1}%
    \begin{list}{}{ % List for each highlight in the section
        \setlength{\leftmargin}{0em} % Margin within the section
    }%
        \item[]%
    }{%
    \end{list}%
}%

\newkeycommand{\experienceItem}[
    company,
    position,
    location,
    duration
]{%
    \textbf{%
        \commandkey{company},
        \commandkey{location}:
        \commandkey{position}
    } \hfill {%
        \commandkey{duration}%
    }
    \vspace{-0.5em}%
}%

% ---------------------------------------

% ----------------- Project -------------
\newkeycommand{\projectItem}[title, duration, keyHighlight]{%
    \textbf{%
        \commandkey{title}%
    } \hfill {%
        \commandkey{duration}%
    } \\ {%
        \commandkey{keyHighlight}%
    }
}%

% ----------------------------------------
