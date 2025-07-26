-- Smart Knowledge Base - Seed Demo Data

-- USERS (passwords are hashed "password" for demo - not real hashes)
INSERT INTO users (email, password_hash, name, bio, avatar_url, is_admin)
VALUES 
('admin@example.com', '$2b$12$adminhash', 'Admin User', 'Knowledge Base Administrator', '', TRUE),
('user1@example.com', '$2b$12$user1hash', 'Jane Doe', 'Expert in tech support.', '', FALSE),
('user2@example.com', '$2b$12$user2hash', 'John Smith', 'FAQ contributor.', '', FALSE);

-- CATEGORIES
INSERT INTO categories (name, description) VALUES
('General', 'General topics and frequently asked questions'),
('Account', 'Account management and settings'),
('AI Assistance', 'Questions about how the AI helps');

-- TAGS
INSERT INTO tags (name) VALUES
('getting-started'),
('billing'),
('profile'),
('ai'),
('troubleshooting');

-- FAQS
INSERT INTO faqs (question, answer, author_id, relevance_score, is_published)
VALUES
("How do I reset my password?",
 "Go to your account settings, click 'Reset Password,' and follow the instructions sent to your email.",
 2, 0.95, TRUE),
("What is the AI search feature?",
 "Our AI-powered search helps you find relevant FAQs and articles based on your question's context.",
 3, 0.93, TRUE),
("How can I update my profile?",
 "On your dashboard, click your avatar and select 'Edit Profile' to update your info and avatar.",
 2, 0.91, TRUE);

-- ARTICLES
INSERT INTO articles (title, content, summary, author_id, is_published)
VALUES
("Welcome to the Knowledge Base",
 "This platform empowers you to explore FAQs and articles efficiently. Use the AI search bar!",
 "Introducing our AI-driven FAQ/Knowledge platform.", 1, TRUE),
("Keeping Your Profile Secure",
 "We use advanced security to protect your data. Update your password regularly and review your account activity.",
 "A guide to securing your account.", 2, TRUE);

-- FAQ_CATEGORY: relate FAQs to categories
INSERT INTO faq_categories (faq_id, category_id) VALUES
(1, 2), -- "How do I reset my password?" -> "Account"
(2, 3), -- "What is the AI search feature?" -> "AI Assistance"
(3, 2); -- "How can I update my profile?" -> "Account"

-- FAQ_TAG: relate FAQs to tags
INSERT INTO faq_tags (faq_id, tag_id) VALUES
(1, 1), -- getting-started
(1, 3), -- profile
(2, 4), -- ai
(2, 1), -- getting-started
(3, 3); -- profile

-- ARTICLE_CATEGORY
INSERT INTO article_categories (article_id, category_id) VALUES
(1, 1),
(2, 2);

-- ARTICLE_TAG
INSERT INTO article_tags (article_id, tag_id) VALUES
(1, 1),
(1, 4),
(2, 3);

-- AUDIT EXAMPLE
INSERT INTO audit_log (user_id, action, entity_type, entity_id, details)
VALUES
(1, 'CREATE', 'faq', 2, 'Created FAQ about AI search feature');
