# AGENTS.md - DTU University Repository Guide

This repository contains DTU Bachelor in Software Technology coursework (2025-2028), including Typst-based lecture notes and Java/JavaFX exam projects.

## Project Structure

```
/home/Mikkel/University/
├── notes/          # Typst lecture notes organized by course code
├── exams/          # Exam projects (Java/JavaFX)
│   └── 02104/      # Snake game project (multi-module Gradle)
└── obsidian-vault/ # Obsidian notes (symlinked to notes/)
```

---

## Build, Lint, and Test Commands

### Java/Gradle Projects (exams/02104/)

All commands run from `/home/Mikkel/University/exams/02104/`

**Build:**
```bash
./gradlew build          # Build all modules with tests
./gradlew assemble       # Build without running tests
./gradlew clean          # Remove build artifacts
./gradlew shadowJar      # Create fat JARs with dependencies
```

**Test:**
```bash
./gradlew test                           # Run all tests
./gradlew :core:test                     # Test only core module
./gradlew :core:test --tests "*PositionTest"  # Run single test class
./gradlew :core:test --tests "*PositionTest.testMove"  # Run single test method
./gradlew test --rerun-tasks             # Force re-run all tests
```

**Lint and Format:**
```bash
./gradlew spotlessCheck       # Check code formatting
./gradlew spotlessApply       # Auto-format all Java files
./gradlew pmdMain            # Run PMD static analysis on main code
./gradlew check              # Run all checks (tests + spotless + PMD)
```

**Run Applications:**
```bash
./gradlew :basic:run          # Run basic Snake application
./gradlew :advanced:run       # Run advanced Snake with plugins
```

### Typst Notes (notes/)

```bash
typst compile notes/02161/lectures/2026-02-02-02161-lecture.typ  # Compile single file
typst watch notes/02161/lectures/2026-02-02-02161-lecture.typ    # Auto-recompile on changes
```

---

## Code Style Guidelines

### Java Code Style (exams/02104/)

**Formatting:**
- **Google Java Format** (v1.33.0) is enforced via Spotless
- Run `./gradlew spotlessApply` before committing
- 2-space indentation
- 100-character line limit (Google standard)

**Imports:**
```java
// Standard library imports first (alphabetical)
import java.util.Objects;
import java.util.ArrayDeque;

// JavaFX imports (alphabetical)
import javafx.application.Application;
import javafx.scene.Scene;

// Project imports last (alphabetical)
import dtu.o2104.snake.model.GameState;
import dtu.o2104.snake.view.GameView;
```

**Naming Conventions:**
```java
// Classes: PascalCase
public class GameState { }
public class SnakeTest { }

// Methods: camelCase (verbs)
public void handleInput() { }
public boolean collidesWithBody() { }
public Position getHead() { }

// Constants: UPPER_SNAKE_CASE
private static final int DEFAULT_WIDTH = 20;
public static final Color SNAKE_HEAD_COLOR = Color.GREEN;

// Variables: camelCase (descriptive)
private int scoreMultiplier;
private Position currentHead;

// Packages: lowercase (reverse domain)
package dtu.o2104.snake.model;
package dtu.o2104.snake.controller;
```

**Javadoc:**
```java
/**
 * Immutable position on the game board (torus coordinates).
 *
 * <p>Represents a discrete (x, y) coordinate. Use {@link GameBoard#wrap(Position)}
 * to handle torus wrapping.
 *
 * @author Sebastian
 */
public class Position {
  /**
   * Creates a new position with the specified coordinates.
   *
   * @param x the x-coordinate (column)
   * @param y the y-coordinate (row)
   */
  public Position(int x, int y) { }
}
```

**Error Handling:**
```java
// Graceful degradation with fallback values
try {
  width = Integer.parseInt(params.get(0));
} catch (NumberFormatException e) {
  System.err.println("Invalid arguments. Using default size");
  width = DEFAULT_WIDTH;
}

// Input validation with bounds checking
if (width < 5 || width > 100) {
  System.err.println("Dimensions must be between 5 and 100");
  width = DEFAULT_WIDTH;
}
```

**Types:**
- Use explicit types for clarity: `List<Position> tail = new ArrayList<>();`
- Prefer interfaces for declarations: `List<Position>` not `ArrayList<Position>`
- Immutable classes: `private final int x;` (e.g., Position class)
- Defensive copying for mutable collections passed to constructors

### Testing Guidelines

**Test Structure:**
```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class PositionTest {
  @Test
  void testEquality() {
    // Arrange - Create test data
    Position p1 = new Position(5, 10);
    Position p2 = new Position(5, 10);
    
    // Act - Perform action (implicit in assertion)
    
    // Assert - Verify results
    assertEquals(p1, p2);
  }
  
  @Test
  void testMoveReturnsNewPosition() {
    // Test immutability and correctness
    Position original = new Position(3, 7);
    Position moved = original.move(Direction.LEFT);
    
    assertNotSame(original, moved);  // New object
    assertEquals(3, original.getX()); // Original unchanged
    assertEquals(2, moved.getX());    // Moved is correct
  }
}
```

**Test Naming:**
- `testMethodName()` - Basic functionality test
- `testMethodNameWithCondition()` - Specific scenario test
- Descriptive names that explain what is being tested

### Typst Style (notes/)

**File Naming:**
```
YYYY-MM-DD-[course-code]-lecture.typ
2026-02-02-02161-lecture.typ
```

**Document Structure:**
```typst
#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "02161",
  course-name: "Software Engineering 1",
  title: "Lecture - February 02, 2026",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

= Section Heading

== Subsection

#definition("Polymorphism")[
  Content here...
]

#example()[
  Example content...
]
```

---

## Architecture Patterns (Java Projects)

**MVC (Model-View-Controller):**
- `model/` - Game logic, no JavaFX dependencies
- `view/` - JavaFX UI components, minimal logic
- `controller/` - Input handling, connects model and view

**Multi-module Gradle:**
- `core/` - Shared MVC library
- `basic/` - Simple Snake application
- `advanced/` - Extended version with plugins

**Design Principles:**
- Immutability: Value objects like `Position` are immutable
- Defensive copying: Deep copy constructors (e.g., `Snake(Snake other)`)
- Plugin architecture: Open/Closed Principle for extensibility

---

## PMD Configuration

The project uses a **pragmatic PMD ruleset** that focuses on critical bugs, not pedantic style rules.

**Disabled rules (intentionally):**
- `SystemPrintln` - Console output allowed for student project
- `ShortVariable`, `LongVariable` - Name length not enforced
- `OnlyOneReturn` - Multiple returns allowed for clarity
- Complexity metrics (NPath, Cyclomatic) - Not enforced

**PMD warnings don't fail the build** - they are advisory only.

---

## Git Workflow

**Ignored files (.gitignore):**
- `*.pdf` - Generated PDFs from Typst
- `**/build/` - Gradle build artifacts
- `.typst/cache/` - Typst compilation cache
- `assignments/`, `exams/` - Private coursework

---

## Configuration Files

**Java version:** 21 (configurable in `gradle.properties`)
```properties
javaVersion=21
javafxVersion=21
```

**Key dependencies:**
- JUnit 5 (Jupiter) for unit tests
- TestFX 4.0.18 for JavaFX UI tests
- Google Guava 33.4.6
- SQLite JDBC 3.47.1.0 (advanced module)

---

## Common Tasks for Agents

1. **Adding a new feature:** Update tests first (TDD), then implementation
2. **Fixing formatting:** Always run `./gradlew spotlessApply` before committing
3. **Running tests:** Use `--tests` flag to target specific test classes/methods
4. **Checking code quality:** Run `./gradlew check` (tests + spotless + PMD)
5. **Creating new Typst notes:** Follow `YYYY-MM-DD-[course]-lecture.typ` naming

---

## Notes for AI Agents

- **Never commit PDFs** - they are generated artifacts
- **Always format before committing** - `./gradlew spotlessApply`
- **Test naming matters** - use descriptive names like `testMoveReturnsNewPosition`
- **PMD warnings are advisory** - use judgment, don't blindly fix all warnings
- **Immutability is key** - Position and similar value objects should be immutable
- **MVC separation** - Keep JavaFX out of model classes
- **Typst template version** - Currently using `@local/dtu-template:0.6.0`
